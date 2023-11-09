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
    onInit();

    return FocusModeSessionState(
      currentSession: 1,
      currentStep: FocusModeSessionSteps.none,
      totalSeconds: pomodoroSessionSeconds,
      remainingSeconds: pomodoroSessionSeconds,
      isPlaying: false,
      pomodoro: pomodoro,
    );
  }

  void onInit() {
    final baseAudioHandler = ref.read(baseAudioHandlerProvider);

    baseAudioHandler.onStreamTaskTotalSeconds.listen((totalSeconds) {
      state = state.copyWith(totalSeconds: totalSeconds);
    });

    baseAudioHandler.onStreamTaskRemainingSeconds.listen((remainingSeconds) {
      state = state.copyWith(remainingSeconds: remainingSeconds);
    });
  }

  void onPlay() async {
    final baseAudioHandler = ref.read(baseAudioHandlerProvider);

    if (state.isNone) {
      state = state.copyWith(
        currentStep: FocusModeSessionSteps.ready,
        isPlaying: true,
      );

      baseAudioHandler.onTaskInit(pomodoro);
    } else {
      onResume();
    }
  }

  void onNext() {}

  void onResume() {
    final baseAudioHandler = ref.read(baseAudioHandlerProvider);

    baseAudioHandler.onTaskResume();

    state = state.copyWith(isPlaying: true);
  }

  void onPause() {
    final baseAudioHandler = ref.read(baseAudioHandlerProvider);

    baseAudioHandler.onTaskPause();

    state = state.copyWith(isPlaying: false);
  }

  void onFinished() {
    onNext();
  }
}
