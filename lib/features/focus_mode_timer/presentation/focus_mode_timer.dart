import 'package:daily_mind/features/focus_mode_timer/presentation/focus_mode_timer_display_text.dart';
import 'package:daily_mind/features/timer_circular_animate/presentation/timer_circular_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class FocusModeTimer extends HookWidget {
  final int seconds;
  final CountdownController countdownController;
  final bool isPlaying;
  final VoidCallback? onFinished;

  const FocusModeTimer({
    super.key,
    required this.seconds,
    required this.countdownController,
    required this.isPlaying,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Countdown(
      controller: countdownController,
      seconds: seconds,
      interval: const Duration(seconds: 1),
      onFinished: onFinished,
      build: (context, remainingSeconds) {
        final percent = (remainingSeconds / seconds);

        return TimerCircularAnimate(
          percent: percent,
          animate: isPlaying,
          center: FocusModeTimerDisplayText(seconds: remainingSeconds),
        );
      },
    );
  }
}
