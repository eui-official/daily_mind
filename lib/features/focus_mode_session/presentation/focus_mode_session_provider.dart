import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/focus_mode_session/domain/focus_mode_session_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timer_count_down/timer_controller.dart';

part 'focus_mode_session_provider.g.dart';

@riverpod
class FocusModeSessionNotifier extends _$FocusModeSessionNotifier {
  final CountdownController countdownController = CountdownController();

  @override
  FocusModeSessionState build(Pomodoro pomodoro) {
    return FocusModeSessionState(
      currentSession: 1,
      currentStep: FocusModeSessionSteps.none,
      currentStepSeconds: startSessionSeconds,
      isPlaying: false,
      pomodoro: pomodoro,
    );
  }

  void onPlay() async {
    if (state.isNone) {
      state = state.copyWith(
        currentStep: FocusModeSessionSteps.ready,
        isPlaying: true,
      );

      countdownController.start();
    } else {
      onResume();
    }
  }

  void onNext() {
    if (state.currentStep == FocusModeSessionSteps.ready) {
      state = state.copyWith(
        currentStep: FocusModeSessionSteps.running,
        currentStepSeconds: sessionSeconds,
      );

      countdownController.restart();
    }
  }

  void onResume() {
    state = state.copyWith(isPlaying: true);
    countdownController.start();
  }

  void onPause() {
    state = state.copyWith(isPlaying: false);
    countdownController.pause();
  }

  void onFinished() {
    onNext();
  }
}
