import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeTimeTotal extends HookWidget {
  final Duration duration;

  const SleepModeTimeTotal({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final hours = duration.inMinutes ~/ TimeOfDay.minutesPerHour;
    final minutes = duration.inMinutes % TimeOfDay.minutesPerHour;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: space(
        [
          Text(
            '$hours',
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('hr'.tr()),
          if (minutes > 0) ...[
            Text(
              '$minutes',
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('min'.tr()),
          ]
        ],
        width: spacing(0.5),
      ),
    );
  }
}
