import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixNotifier extends StateNotifier<void> {
  PlayMixNotifier() : super({});

  List<GaplessAudioPlayer> players = [];

  void playPlaylist(List<PlaylistItem> items) {
    players = [];

    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.setSource(item.id);
      player.setVolume(item.volume);
      player.play();

      players.add(player);
    }
  }

  void disposePlaylist() {
    for (var player in players) {
      player.dispose();
    }
  }
}

final playMixProvider = StateNotifierProvider<PlayMixNotifier, void>((ref) {
  return PlayMixNotifier();
});
