import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';

class TaskBackgroundData {
  final String taskTitle;
  final int taskSeconds;
  final int taskRemainingSeconds;
  final FocusModeSessionSteps taskCurrentStep;
  final int taskCurrentSession;
  final int taskWorkingSessions;
  final bool taskIsPlaying;

  TaskBackgroundData({
    required this.taskTitle,
    required this.taskSeconds,
    required this.taskRemainingSeconds,
    required this.taskCurrentStep,
    required this.taskCurrentSession,
    required this.taskWorkingSessions,
    required this.taskIsPlaying,
  });
}
