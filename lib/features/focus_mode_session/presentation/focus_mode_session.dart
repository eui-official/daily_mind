import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/focus_mode_actions/presentation/focus_mode_actions.dart';
import 'package:daily_mind/features/focus_mode_audio/presentation/focus_mode_audio.dart';
import 'package:daily_mind/features/focus_mode_session/hook/useBackgroundTaskData.dart';
import 'package:daily_mind/features/focus_mode_session_current_step_text/presentation/focus_mode_session_current_step_text.dart';
import 'package:daily_mind/features/focus_mode_timer/presentation/focus_mode_timer.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeSession extends HookConsumerWidget {
  const FocusModeSession({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final taskBackgroundData = useBackgroundTaskData(ref);

    final onClose = useCallback(
      () async {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: 'Bạn có chắc chắn muốn thoát?',
        );

        if (context.mounted) {
          if (result == OkCancelResult.ok) {
            baseBackgroundHandler.onTaskReset();
            context.pop();
          }
        }
      },
      [context],
    );

    final onSettings = useCallback(
      () async {
        final result = await showOkCancelAlertDialog(
          context: context,
          title: 'Bạn có chắc chắn muốn quay lại từ đầu?',
        );

        if (context.mounted) {
          if (result == OkCancelResult.ok) {
            baseBackgroundHandler.onTaskRestart();
          }
        }
      },
      [],
    );

    useEffect(() {
      return () {
        baseBackgroundHandler.onTaskDisposeBackgroundAudio();
      };
    }, []);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: space(
                [
                  Text(
                    taskBackgroundData.taskTitle,
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FocusModeSessionCurrentStepText(
                    step: taskBackgroundData.taskCurrentStep,
                    currentSession: taskBackgroundData.taskCurrentSession,
                    workingSessions: taskBackgroundData.taskWorkingSessions,
                  ),
                ],
                height: spacing(2),
              ),
            ),
            FocusModeTimer(
              isPlaying: taskBackgroundData.taskIsPlaying,
              remainingSeconds: taskBackgroundData.taskRemainingSeconds,
              seconds: taskBackgroundData.taskSeconds,
            ),
            FocusModeAudio(
              onAudioSelected: baseBackgroundHandler.onUpdateAudioId,
              onAudioDeleted: baseBackgroundHandler.onDeleteAudioId,
              title: taskBackgroundData.taskAudioOffline?.name.tr(),
            ),
            FocusModeActions(
              isPlaying: taskBackgroundData.taskIsPlaying,
              onClose: onClose,
              onPause: baseBackgroundHandler.onTaskPause,
              onPlay: baseBackgroundHandler.onTaskStart,
              onSettings: onSettings,
              step: taskBackgroundData.taskCurrentStep,
            ),
          ],
        ),
      ),
    );
  }
}
