import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_mode_pomodoro_state.freezed.dart';

@freezed
class FocusModePomodoroState with _$FocusModePomodoroState {
  const factory FocusModePomodoroState({
    required String title,
    required String icon,
    required int workingSessions,
    required int shortBreak,
    required int longBreak,
  }) = _FocusModePomodoroState;
}
