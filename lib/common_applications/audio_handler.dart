import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/online_audio_player.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:just_audio/just_audio.dart';

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

  void onInitPlaylist(List<PlaylistItem> items) {
    pause();

    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.onSetSource(item.id);
      player.onSetVolume(item.volume);

      playerItems.add(OfflinePlayerItem(
        player: player,
        id: item.id,
      ));

      networkType = NetworkType.offline;

      play();
      onInitPlaybackState();
    }
  }

  void onInitStory(Story story) async {
    pause();

    await onlinePlayer.onInitSource(story.source, LoopMode.one);

    mediaItem.add(
      MediaItem(
        id: story.source,
        title: story.name,
        artUri: Uri.parse(story.image),
        duration: onlinePlayer.player.duration,
      ),
    );

    networkType = NetworkType.online;

    play();
    onInitPlaybackState();
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

  void onClearMix() {}

  void onClearStory() {
    onlinePlayer.onDispose();
  }

  void onPauseStory() {
    onlinePlayer.onPause();
  }

  void onPlayStory() {
    onlinePlayer.player.play();
  }

  void onDispose() {
    for (var playerItem in playerItems) {
      playerItem.player.onDispose();
    }
  }

  void onInitPlaybackState() async {
    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        controls: [
          MediaControl.pause,
          MediaControl.play,
        ],
      ),
    );
  }

  @override
  Future<void> play() async {
    if (networkType == NetworkType.offline) {
      onPlayMix();
    } else {
      onPlayStory();
    }
    playbackState.add(playbackState.value.copyWith(playing: true));

    return super.play();
  }

  @override
  Future<void> pause() async {
    onPauseMix();
    onPauseStory();
    playbackState.add(playbackState.value.copyWith(playing: false));

    return super.pause();
  }
}
