import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_actions/presentation/focus_mode_actions.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/focus_mode_session/presentation/focus_mode_session_provider.dart';
import 'package:daily_mind/features/focus_mode_session_current_step_text/presentation/focus_mode_session_current_step_text.dart';
import 'package:daily_mind/features/focus_mode_timer/presentation/focus_mode_timer.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeSession extends HookConsumerWidget {
  final Pomodoro pomodoro;

  const FocusModeSession({
    super.key,
    required this.pomodoro,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final focusModeSessionNotifierMemoized = useMemoized(
      () => focusModeSessionNotifierProvider(pomodoro),
      [pomodoro],
    );
    final focusModeState = ref.watch(focusModeSessionNotifierMemoized);
    final focusModeNotifier =
        ref.read(focusModeSessionNotifierMemoized.notifier);

    final taskRemainingSecondsSnapshot =
        useStream(baseBackgroundHandler.onStreamTaskRemainingSeconds);
    final taskSecondsSnapshot =
        useStream(baseBackgroundHandler.onStreamTaskSeconds);
    final taskCurrentStepSnapshot =
        useStream(baseBackgroundHandler.onStreamTaskCurrentStep);

    final seconds = taskSecondsSnapshot.data ?? 0;
    final remainingSeconds = taskRemainingSecondsSnapshot.data ?? 0;
    final taskCurrentStep =
        taskCurrentStepSnapshot.data ?? FocusModeSessionSteps.ready;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight * 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: space(
                [
                  Text(
                    pomodoro.title ?? emptyString,
                    style: context.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FocusModeSessionCurrentStepText(
                    step: taskCurrentStep,
                    currentSession: baseBackgroundHandler.taskCurrentSession,
                    workingSessions: baseBackgroundHandler
                        .taskCurrentPomodoro.workingSessions,
                  ),
                ],
                height: spacing(2),
              ),
            ),
            FocusModeTimer(
              isPlaying: focusModeState.isPlaying,
              remainingSeconds: remainingSeconds,
              seconds: seconds,
            ),
            FocusModeActions(
              isPlaying: focusModeState.isPlaying,
              onPause: focusModeNotifier.onTaskPause,
              onPlay: focusModeNotifier.onTaskPlay,
              step: taskCurrentStep,
            ),
          ],
        ),
      ),
    );
  }
}
