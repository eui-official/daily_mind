import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_mode_session_state.freezed.dart';

@freezed
class FocusModeSessionState with _$FocusModeSessionState {
  const FocusModeSessionState._();

  const factory FocusModeSessionState({
    required FocusModeSessionSteps currentStep,
    required int currentSession,
    required int currentStepSeconds,
    required Pomodoro pomodoro,
    required bool isPlaying,
  }) = _FocusModeSessionState;

  bool get isNone => currentStep == FocusModeSessionSteps.none;
}
