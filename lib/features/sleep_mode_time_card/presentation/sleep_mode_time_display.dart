import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:flutter/material.dart';

class SleepModeTimeDisplay extends StatelessWidget {
  final DateTime time;

  const SleepModeTimeDisplay({
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      dateFormatter.onFormatTime(time),
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
