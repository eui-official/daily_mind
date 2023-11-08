import 'package:daily_mind/features/focus_mode_timer/presentation/focus_mode_timer_display_text.dart';
import 'package:daily_mind/features/timer_circular_animate/presentation/timer_circular_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeTimer extends HookWidget {
  final int remainingSeconds;
  final int totalSeconds;
  final bool isPlaying;
  final VoidCallback? onFinished;

  const FocusModeTimer({
    super.key,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.isPlaying,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (remainingSeconds / totalSeconds);

    return TimerCircularAnimate(
      percent: percent,
      animate: isPlaying,
      center: FocusModeTimerDisplayText(seconds: remainingSeconds),
    );
  }
}
