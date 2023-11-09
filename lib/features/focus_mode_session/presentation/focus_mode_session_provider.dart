import 'package:daily_mind/common_applications/base_audio_handler/application/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/focus_mode_session/domain/focus_mode_session_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'focus_mode_session_provider.g.dart';

@riverpod
class FocusModeSessionNotifier extends _$FocusModeSessionNotifier {
  @override
  FocusModeSessionState build(Pomodoro pomodoro) {
    final baseBackgroundHandler = ref.read(baseBackgroundHandlerProvider);
    baseBackgroundHandler.onTaskInit(pomodoro);

    return const FocusModeSessionState(isPlaying: false);
  }

  void onTaskPlay() async {
    final baseBackgroundHandler = ref.read(baseBackgroundHandlerProvider);

    if (baseBackgroundHandler.onStreamTaskCurrentStep.value ==
        FocusModeSessionSteps.ready) {
      state = state.copyWith(isPlaying: true);
      baseBackgroundHandler.onTaskStart();
    } else {
      onTaskResume();
    }
  }

  void onTaskResume() {
    final baseBackgroundHandler = ref.read(baseBackgroundHandlerProvider);

    baseBackgroundHandler.onTaskResume();
    state = state.copyWith(isPlaying: true);
  }

  void onTaskPause() {
    final baseBackgroundHandler = ref.read(baseBackgroundHandlerProvider);

    baseBackgroundHandler.onTaskPause();
    state = state.copyWith(isPlaying: false);
  }
}
