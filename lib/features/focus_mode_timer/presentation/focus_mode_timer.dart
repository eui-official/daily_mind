import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:timer_count_down/timer_count_down.dart';

class FocusModeTimer extends StatelessWidget {
  const FocusModeTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 1500,
      interval: const Duration(seconds: 1),
      build: (context, seconds) {
        final percent = (seconds / 1500);

        return SizedBox(
          height: context.height / 2,
          child: CircularPercentIndicator(
            radius: context.width / 3,
            lineWidth: spacing(2),
            percent: percent,
            center: Text(
              dateFormatter.onFormatDuration(
                Duration(
                  seconds: seconds.toInt(),
                ),
              ),
              style: context.textTheme.displayLarge,
            ),
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: context.theme.cardColor,
            progressColor: context.theme.primaryColorDark,
          ),
        );
      },
    );
  }
}
