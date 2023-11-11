import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/schemas/task.dart';

class TaskBackgroundData {
  final AudioOffline? taskAudioOffline;
  final bool taskIsPlaying;
  final FocusModeSessionSteps taskCurrentStep;
  final int taskCurrentSession;
  final int taskRemainingSeconds;
  final int taskSeconds;
  final int taskWorkingSessions;
  final String taskTitle;
  final Task taskCurrent;

  TaskBackgroundData({
    required this.taskCurrent,
    required this.taskCurrentSession,
    required this.taskCurrentStep,
    required this.taskIsPlaying,
    required this.taskRemainingSeconds,
    required this.taskSeconds,
    required this.taskTitle,
    required this.taskWorkingSessions,
    this.taskAudioOffline,
  });
}
