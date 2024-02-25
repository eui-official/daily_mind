import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SleepModeWakeUpTimeCard extends StatelessWidget {
  final WakeUpTime wakeUpTime;

  const SleepModeWakeUpTimeCard({
    super.key,
    required this.wakeUpTime,
  });

  @override
  Widget build(BuildContext context) {
    final duration = wakeUpTime.endTime.difference(wakeUpTime.startTime);

    return Container(
      width: context.width,
      padding: EdgeInsets.all(spacing(2)),
      decoration: BoxDecoration(
        borderRadius: circularRadius(2),
        color: context.theme.cardColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('HH:mm a').format(wakeUpTime.endTime),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ngủ ${duration.inHours.toString()} giờ, ${wakeUpTime.cycles} chu kỳ',
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.theme.hintColor,
                ),
              ),
            ],
          ),
          Chip(
            shape: RoundedRectangleBorder(
              borderRadius: circularRadius(3),
              side: BorderSide(
                color: context.theme.primaryColorDark,
              ),
            ),
            backgroundColor: context.theme.primaryColorDark.withOpacity(0.4),
            label: const Text('Đề xuất'),
          )
        ],
      ),
    );
  }
}
