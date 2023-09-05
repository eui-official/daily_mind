import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/play_mix/domain/play_mix_state.dart';
import 'package:daily_mind/features/play_mix/domain/player_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixNotifier extends StateNotifier<PlayMixState> {
  PlayMixNotifier()
      : super(
          const PlayMixState(
            isPlaying: true,
            playerItems: [],
          ),
        );

  late DailyMindAudioHandler audioHandler;

  void setAudioHandler(DailyMindAudioHandler newAudioHandler) {
    audioHandler = newAudioHandler;
  }

  void playPlaylist(List<PlaylistItem> items) {
    for (var item in items) {
      final playerItems = List<PlayerItem>.from(state.playerItems);
      final player = GaplessAudioPlayer();

      player.setSource(item.id);
      player.setVolume(item.volume);

      playerItems.add(PlayerItem(
        player: player,
        id: item.id,
      ));

      state = state.copyWith(playerItems: playerItems);
    }

    play();
  }

  void updateVolume(double volume, String itemId, int playlistId) {
    final playerItem =
        state.playerItems.firstWhere((item) => item.id == itemId);
    playerItem.player.setVolume(volume);

    db.updateVolume(volume, itemId, playlistId);
  }

  void disposePlaylist() {
    for (var playerItme in state.playerItems) {
      playerItme.player.dispose();
    }
  }

  void play() {
    audioHandler.setSoundId(state.playerItems.first.id);
    audioHandler.play();

    for (var playerItme in state.playerItems) {
      playerItme.player.play();

      state = state.copyWith(isPlaying: true);
    }
  }

  void stop() {
    for (var playerItme in state.playerItems) {
      playerItme.player.stop();
      state = state.copyWith(isPlaying: false);
    }
  }
}

final playMixProvider =
    StateNotifierProvider<PlayMixNotifier, PlayMixState>((ref) {
  return PlayMixNotifier();
});
