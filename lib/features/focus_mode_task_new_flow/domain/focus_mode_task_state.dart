import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_mode_task_state.freezed.dart';

@freezed
class FocusModeTaskState with _$FocusModeTaskState {
  const factory FocusModeTaskState({
    required String title,
    required String iconId,
    required int workingSessions,
    required int shortBreak,
    required int longBreak,
  }) = _FocusModeTaskState;
}
