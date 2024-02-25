import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_end.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_recommended.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_sleep.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SleepModeTimeCard extends StatelessWidget {
  final WakeUpTime wakeUpTime;

  const SleepModeTimeCard({
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
              SleepModeTimeEnd(endTime: wakeUpTime.endTime),
              SleepModeTimeSleep(
                duration: duration,
                cycles: wakeUpTime.cycles,
              ),
            ],
          ),
          const SleepModeTimeRecommended(),
        ],
      ),
    );
  }
}
