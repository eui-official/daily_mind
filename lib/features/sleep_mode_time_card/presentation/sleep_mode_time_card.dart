import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_end.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_recommended.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_sleep.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SleepModeTimeCard extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final WakeUpTime wakeUpTime;
  final bool isShowRecommended;

  const SleepModeTimeCard({
    super.key,
    required this.wakeUpTime,
    this.isShowRecommended = false,
    this.onTap,
    this.padding,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final duration = wakeUpTime.endTime.difference(wakeUpTime.startTime);

    return BaseInkWell(
      onTap: onTap,
      borderRadius: circularRadius(2),
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
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
            if (isShowRecommended) const SleepModeTimeRecommended(),
            trailing,
          ].whereNotNull().toList(),
        ),
      ),
    );
  }
}
