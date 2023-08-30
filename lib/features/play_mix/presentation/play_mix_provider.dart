import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/play_mix/domain/player_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixNotifier extends StateNotifier<void> {
  PlayMixNotifier() : super({});

  List<PlayerItem> playerItems = [];

  void playPlaylist(List<PlaylistItem> items) {
    for (var item in items) {
      final player = GaplessAudioPlayer();

      player.setSource(item.id);
      player.setVolume(item.volume);
      player.play();

      playerItems.add(PlayerItem(
        player: player,
        id: item.id,
      ));
    }
  }

  void updateVolume(double volume, String itemId, int playlistId) {
    final playerItem = playerItems.firstWhere((item) => item.id == itemId);
    playerItem.player.setVolume(volume);

    db.updateVolume(volume, itemId, playlistId);
  }

  void disposePlaylist() {
    for (var playerItme in playerItems) {
      playerItme.player.dispose();
    }
  }
}

final playMixProvider = StateNotifierProvider<PlayMixNotifier, void>((ref) {
  return PlayMixNotifier();
});
