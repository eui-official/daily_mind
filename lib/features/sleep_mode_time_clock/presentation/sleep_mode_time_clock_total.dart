import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeTimeClockTotal extends HookWidget {
  final Duration duration;

  const SleepModeTimeClockTotal({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final hours = duration.inMinutes ~/ TimeOfDay.minutesPerHour;
    final minutes = duration.inMinutes % TimeOfDay.minutesPerHour;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: space(
        [
          Text(
            '$hours hr',
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          if (minutes > 0) ...[
            Text(
              '$minutes min',
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ]
        ],
        width: spacing(0.5),
      ),
    );
  }
}
