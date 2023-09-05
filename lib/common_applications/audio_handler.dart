import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/assets.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/play_mix/domain/player_item.dart';

class DailyMindAudioHandler extends BaseAudioHandler {
  late String soundId;
  List<PlayerItem> playerItems = [];

  void setupPlaylist(List<PlaylistItem> items) {
    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.setSource(item.id);
      player.setVolume(item.volume);

      playerItems.add(PlayerItem(
        player: player,
        id: item.id,
      ));

      play();
    }
  }

  void updateVolume(double volume, String itemId, int playlistId) {
    final playerItem = playerItems.firstWhere((item) => item.id == itemId);
    playerItem.player.setVolume(volume);
  }

  void playMix() {
    for (var playerItme in playerItems) {
      playerItme.player.play();
    }
  }

  void stopMix() {
    for (var playerItem in playerItems) {
      playerItem.player.stop();
    }
  }

  void dispose() {
    for (var playerItem in playerItems) {
      playerItem.player.dispose();
    }
  }

  void playMediaNotification() async {
    final artUri = await getSoundImageFromAsset(playerItems.first.id);

    mediaItem.add(
      MediaItem(
        album: 'Natural sounds',
        displayDescription: 'Natural sounds',
        id: 'dailyMind',
        title: 'DailyMind',
        artUri: artUri,
      ),
    );

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

  void pauseMediaNotification() {
    playbackState.add(playbackState.value.copyWith(playing: false));
  }

  @override
  Future<void> play() async {
    playMediaNotification();
    playMix();
  }

  @override
  Future<void> pause() async {
    pauseMediaNotification();
    stopMix();
  }
}
