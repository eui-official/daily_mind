import 'package:daily_mind/features/focus_mode_timer/presentation/focus_mode_timer_display_text.dart';
import 'package:daily_mind/features/timer_circular_animate/presentation/timer_circular_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeTimer extends HookWidget {
  final bool isRunning;
  final int remainingSeconds;
  final int seconds;

  const FocusModeTimer({
    super.key,
    required this.isRunning,
    required this.remainingSeconds,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (remainingSeconds / seconds);

    return TimerCircularAnimate(
      percent: percent,
      animate: isRunning,
      center: FocusModeTimerDisplayText(seconds: remainingSeconds),
    );
  }
}
