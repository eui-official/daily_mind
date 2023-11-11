import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/extensions/audio.dart';
import 'package:daily_mind/features/focus_mode_session/domain/task_data.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

TaskBackgroundData useBackgroundTaskData(WidgetRef ref) {
  final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
  final taskTitle = baseBackgroundHandler.taskTitle;
  final taskCurrentSession = baseBackgroundHandler.taskCurrentSession;
  final taskWorkingSessions = baseBackgroundHandler.taskWorkingSessions;

  final taskCurrentSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskCurrent);
  final taskRemainingSecondsSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskRemainingSeconds);
  final taskSecondsSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskSeconds);
  final taskCurrentStepSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskCurrentStep);
  final taskPlayingSnapshot =
      useStream(baseBackgroundHandler.onStreamTaskPlaying);

  final taskCurrent = taskCurrentSnapshot.data ?? Task();
  final taskSeconds = taskSecondsSnapshot.data ?? 0;
  final taskRemainingSeconds = taskRemainingSecondsSnapshot.data ?? 0;
  final taskCurrentStep =
      taskCurrentStepSnapshot.data ?? FocusModeSessionSteps.ready;
  final taskIsPlaying = taskPlayingSnapshot.data ?? false;

  final taskAudioOffline = useMemoized(() {
    final audioId = taskCurrent.audioId;
    return offlineAudios.getId(audioId);
  }, [
    taskCurrent,
  ]);

  return TaskBackgroundData(
    taskAudioOffline: taskAudioOffline,
    taskCurrent: taskCurrent,
    taskCurrentSession: taskCurrentSession,
    taskCurrentStep: taskCurrentStep,
    taskIsPlaying: taskIsPlaying,
    taskRemainingSeconds: taskRemainingSeconds,
    taskSeconds: taskSeconds,
    taskTitle: taskTitle,
    taskWorkingSessions: taskWorkingSessions,
  );
}
