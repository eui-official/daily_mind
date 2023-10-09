import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/assets.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/online_audio_player.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

class DailyMindAudioHandler extends BaseAudioHandler {
  Timer? timer;
  List<OfflinePlayerItem> playerItems = [];
  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();
  NetworkType networkType = NetworkType.none;

  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isBefore(time)) {
        onPauseMix();
        timer.cancel();
      }
    });
  }

  void onInitOfflinePlaylist(
    Playlist playlist,
    List<PlaylistItem> items,
  ) async {
    pause();
    onClearPlayerItems();

    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.onSetSource(item.id);
      player.onSetVolume(item.volume);

      playerItems.add(OfflinePlayerItem(
        player: player,
        id: item.id,
      ));

      mediaItem.add(
        MediaItem(
          id: '${playlist.id}',
          title: playlist.title ?? appDescription,
          artUri: await onGetSoundImageFromAsset(item.id),
        ),
      );

      networkType = NetworkType.offline;

      play();
      onInitPlaybackState();
    }
  }

  void onInitItem(
    Item item,
    List<Item> fullItems,
  ) async {
    pause();

    await onlinePlayer.onInitSource(
      item,
      fullItems: fullItems,
    );

    networkType = NetworkType.online;

    play();
    onInitPlaybackState(NetworkType.online);
    onOnlinePlayerPlayStateChanged();
  }

  void onOnlinePlayerPlayStateChanged() {
    onlinePlayer.player.positionStream.listen((newDuration) {
      playbackState.add(
        playbackState.value.copyWith(updatePosition: newDuration),
      );
    });

    onlinePlayer.player.currentIndexStream.listen((index) {
      final currentIndex = index ?? 0;
      final sequence = onlinePlayer.player.audioSource?.sequence ?? [];

      if (sequence.isNotEmpty) {
        final item = sequence[currentIndex];

        mediaItem.add(
          MediaItem(
            id: item.tag.source,
            title: item.tag.name,
            artUri: Uri.parse(item.tag.image),
            duration: onlinePlayer.player.duration,
          ),
        );
      }
    });
  }

  void onUpdateVolume(double volume, String itemId, int playlistId) {
    final playerItem = playerItems.firstWhere((item) => item.id == itemId);
    playerItem.player.onSetVolume(volume);
  }

  void onPlayMix() {
    for (var playerItme in playerItems) {
      playerItme.player.onPlay();
    }
  }

  void onPauseMix() {
    for (var playerItem in playerItems) {
      playerItem.player.onPause();
    }
  }

  void onClearPlayerItems() {
    for (var playerItem in playerItems) {
      playerItem.player.onDispose();
    }

    playerItems.clear();
  }

  void onClearMix() {}

  void onClearStory() {
    onlinePlayer.onDispose();
  }

  void onPauseItem() {
    onlinePlayer.onPause();
  }

  void onPlayItem() {
    onlinePlayer.onPlay();
  }

  void onNextItem() {
    onlinePlayer.player.seekToNext();
  }

  void onPreviousItem() {
    onlinePlayer.player.seekToPrevious();
  }

  void onDispose() {
    for (var playerItem in playerItems) {
      playerItem.player.onDispose();
    }
  }

  void onInitPlaybackState([NetworkType type = NetworkType.offline]) async {
    final controls = [
      MediaControl.pause,
      MediaControl.play,
    ];

    if (type == NetworkType.online) {
      controls.addAll([
        MediaControl.skipToNext,
        MediaControl.skipToPrevious,
      ]);
    }

    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        controls: controls,
      ),
    );
  }

  @override
  Future<void> play() async {
    if (networkType == NetworkType.offline) {
      onPlayMix();
    } else {
      onPlayItem();
    }

    playbackState.add(playbackState.value.copyWith(playing: true));

    return super.play();
  }

  @override
  Future<void> pause() async {
    onPauseMix();
    onPauseItem();
    playbackState.add(playbackState.value.copyWith(playing: false));

    return super.pause();
  }

  @override
  Future<void> skipToNext() {
    onlinePlayer.player.seekToNext();

    return super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() {
    onlinePlayer.player.seekToPrevious();

    return super.skipToPrevious();
  }
}
