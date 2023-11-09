import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusModeTimerDisplayText extends StatelessWidget {
  final int seconds;

  const FocusModeTimerDisplayText({
    super.key,
    required this.seconds,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      dateFormatter.onFormatDuration(
        Duration(seconds: seconds),
      ),
      style: context.textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: spacing(0.5),
      ),
    );
  }
}
