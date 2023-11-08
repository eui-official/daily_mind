import 'package:daily_mind/features/focus_mode_timer/presentation/focus_mode_timer_display_text.dart';
import 'package:daily_mind/features/timer_circular/presentation/timer_circular.dart';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';

class FocusModeTimer extends StatelessWidget {
  const FocusModeTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 120,
      interval: const Duration(seconds: 1),
      build: (context, seconds) {
        final percent = (seconds / 120);

        return TimerCircular(
          percent: percent,
          center: FocusModeTimerDisplayText(seconds: seconds),
        );
      },
    );
  }
}
