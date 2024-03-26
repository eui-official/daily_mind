import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/extensions/date_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class SleepModeDurationRemaining extends HookWidget {
  final DateTime endTime;

  const SleepModeDurationRemaining({
    super.key,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    final now = useBaseDateTimeTicker();
    final remaining = endTime.onGetDurationDifference(now);

    return Column(
      children: space(
        [
          Text(
            'Thời gian còn lại',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.theme.hintColor,
            ),
          ),
          Text(
            dateFormatter.onFormatDuration(remaining),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        height: spacing(),
      ),
    );
  }
}
