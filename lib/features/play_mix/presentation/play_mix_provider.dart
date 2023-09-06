import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/play_mix/domain/play_mix_state.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixNotifier extends StateNotifier<PlayMixState> {
  PlayMixNotifier() : super(const PlayMixState());

  late DailyMindAudioHandler audioHandler;

  void setAudioHandler(DailyMindAudioHandler newAudioHandler) {
    audioHandler = newAudioHandler;
  }

  void updateVolume(double volume, String itemId, int playlistId) {
    audioHandler.updateVolume(volume, itemId, playlistId);

    db.updateVolume(volume, itemId, playlistId);
  }

  void updateTimer(Time time) {
    state = state.copyWith(time: time);
    audioHandler.startTimer(time);
  }
}

final playMixProvider =
    StateNotifierProvider<PlayMixNotifier, PlayMixState>((ref) {
  return PlayMixNotifier();
});
