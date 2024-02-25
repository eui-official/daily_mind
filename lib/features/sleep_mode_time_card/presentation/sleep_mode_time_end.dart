import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:flutter/material.dart';

class SleepModeTimeEnd extends StatelessWidget {
  final DateTime endTime;

  const SleepModeTimeEnd({
    super.key,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      dateFormatter.onFormatTime(endTime),
      style: context.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
