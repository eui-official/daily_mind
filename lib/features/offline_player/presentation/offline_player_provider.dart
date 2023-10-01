import 'dart:async';

import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_applications/time.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/offline_player/domain/play_mix_state.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflinePlayerNotifier extends StateNotifier<PlayMixState> {
  Timer? timer;
  final DailyMindAudioHandler audioHandler;

  OfflinePlayerNotifier({
    required this.audioHandler,
  }) : super(const PlayMixState());

  void onStartTimer(Time time) {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isBefore(time)) {
        state = state.copyWith(time: empty);
      }
    });
  }

  void onUpdateVolume(double volume, String itemId, int playlistId) {
    audioHandler.onUpdateVolume(volume, itemId, playlistId);

    db.updateVolume(volume, itemId, playlistId);
  }

  void onUpdateTimer(Time time) {
    state = state.copyWith(time: time);

    onStartTimer(time);
    audioHandler.onStartTimer(time);
  }
}

final playMixProvider =
    StateNotifierProvider<OfflinePlayerNotifier, PlayMixState>((ref) {
  final baseAudioHandlerNotifier = ref.read(baseAudioHandlerProvider.notifier);

  return OfflinePlayerNotifier(
    audioHandler: baseAudioHandlerNotifier.audioHandler,
  );
});
