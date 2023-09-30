import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_applications/online_audio_player.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/domain/offline_player_item.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:just_audio/just_audio.dart';

class DailyMindAudioHandler extends BaseAudioHandler {
  Timer? timer;
  List<OfflinePlayerItem> playerItems = [];
  final onlinePlayer = OnlineAudioPlayer();

  void startTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isBefore(time)) {
        onStopMix();
        timer.cancel();
      }
    });
  }

  void onInitPlaylist(List<PlaylistItem> items) {
    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.setSource(item.id);
      player.setVolume(item.volume);

      playerItems.add(OfflinePlayerItem(
        player: player,
        id: item.id,
      ));

      play();
    }
  }

  void onUpdateVolume(double volume, String itemId, int playlistId) {
    final playerItem = playerItems.firstWhere((item) => item.id == itemId);
    playerItem.player.setVolume(volume);
  }

  void onPlayMix() {
    for (var playerItme in playerItems) {
      playerItme.player.play();
    }
  }

  void onStopMix() {
    for (var playerItem in playerItems) {
      playerItem.player.stop();
    }
  }

  void onStopStory() {
    onlinePlayer.onStop();
  }

  void onPlayStory() {
    onlinePlayer.player.play();
  }

  void onInitStory(Story story) async {
    await onlinePlayer.onInitSource(story.source, LoopMode.off);
    mediaItem.add(
      MediaItem(
        id: story.id,
        title: story.name,
        artUri: Uri.parse(story.source),
        duration: onlinePlayer.player.duration,
      ),
    );
    onUpdatePlaybackState();
  }

  void onDispose() {
    for (var playerItem in playerItems) {
      playerItem.player.dispose();
    }
  }

  void onUpdatePlaybackState() async {
    playbackState.add(
      playbackState.value.copyWith(
        playing: true,
        processingState: AudioProcessingState.ready,
        repeatMode: AudioServiceRepeatMode.none,
        shuffleMode: AudioServiceShuffleMode.none,
        controls: [
          MediaControl.pause,
          MediaControl.play,
        ],
      ),
    );
  }

  void onPausePlaybackState() {
    playbackState.add(
      playbackState.value.copyWith(
        playing: false,
      ),
    );
  }

  @override
  Future<void> play() async {
    onUpdatePlaybackState();
    onPlayMix();
    onPlayStory();
  }

  @override
  Future<void> pause() async {
    onPausePlaybackState();
    onStopMix();
    onStopStory();
  }
}
