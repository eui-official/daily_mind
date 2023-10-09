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
import 'package:rxdart/rxdart.dart';

class DailyMindAudioHandler extends BaseAudioHandler {
  List<OfflinePlayerItem> playerItems = [];
  NetworkType networkType = NetworkType.none;
  OnlineAudioPlayer onlinePlayer = OnlineAudioPlayer();
  StreamController<Playlist> streamCurrentPlaylist = BehaviorSubject();
  Timer? timer;

  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isBefore(time)) {
        onPauseMix();
        timer.cancel();
      }
    });
  }

  void onInitOfflinePlaylist(Playlist playlist) async {
    pause();
    onClearPlayerItems();

    streamCurrentPlaylist.add(playlist);

    final items = playlist.items ?? [];

    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.onSetSource(item.id);
      player.setVolume(item.volume);

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
    onlinePlayer.positionStream.listen((newDuration) {
      playbackState.add(
        playbackState.value.copyWith(updatePosition: newDuration),
      );
    });

    onlinePlayer.currentIndexStream.listen((index) {
      final currentIndex = index ?? 0;
      final sequence = onlinePlayer.audioSource?.sequence ?? [];

      if (sequence.isNotEmpty) {
        final item = sequence[currentIndex];

        mediaItem.add(
          MediaItem(
            id: item.tag.source,
            title: item.tag.name,
            artUri: Uri.parse(item.tag.image),
            duration: onlinePlayer.duration,
          ),
        );
      }
    });
  }

  void onUpdateVolume(double volume, String itemId, int playlistId) {
    final playerItem = playerItems.firstWhere((item) => item.id == itemId);
    playerItem.player.setVolume(volume);
  }

  void onPlayMix() {
    for (var playerItem in playerItems) {
      playerItem.player.play();
    }
  }

  void onPauseMix() {
    for (var playerItem in playerItems) {
      playerItem.player.pause();
    }
  }

  void onClearPlayerItems() {
    for (var playerItem in playerItems) {
      playerItem.player.dispose();
    }

    playerItems.clear();
  }

  void onClearMix() {}

  void onClearStory() {
    onlinePlayer.dispose();
  }

  void onPauseItem() {
    onlinePlayer.pause();
  }

  void onPlayItem() {
    onlinePlayer.play();
  }

  void onNextItem() {
    onlinePlayer.seekToNext();
  }

  void onPreviousItem() {
    onlinePlayer.seekToPrevious();
  }

  void onDispose() {
    for (var playerItem in playerItems) {
      playerItem.player.dispose();
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
    onlinePlayer.seekToNext();

    return super.skipToNext();
  }

  @override
  Future<void> skipToPrevious() {
    onlinePlayer.seekToPrevious();

    return super.skipToPrevious();
  }
}
