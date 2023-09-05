import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/db/db.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixNotifier extends StateNotifier<void> {
  PlayMixNotifier() : super({});

  late DailyMindAudioHandler audioHandler;

  void setAudioHandler(DailyMindAudioHandler newAudioHandler) {
    audioHandler = newAudioHandler;
  }

  void updateVolume(double volume, String itemId, int playlistId) {
    audioHandler.updateVolume(volume, itemId, playlistId);

    db.updateVolume(volume, itemId, playlistId);
  }
}

final playMixProvider = StateNotifierProvider<PlayMixNotifier, void>((ref) {
  return PlayMixNotifier();
});
