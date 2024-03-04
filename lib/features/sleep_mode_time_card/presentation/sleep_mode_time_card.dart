import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_display.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_recommended.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_sleep.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SleepModeTimeCard extends StatelessWidget {
  final bool isShowRecommended;
  final BoxDecoration? decoration;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final WakeUpTime wakeUpTime;
  final Widget? trailing;

  const SleepModeTimeCard({
    super.key,
    required this.wakeUpTime,
    this.isShowRecommended = false,
    this.color,
    this.decoration,
    this.onTap,
    this.padding,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final duration = wakeUpTime.endTime.difference(wakeUpTime.startTime);

    return BaseInkWell(
      color: color,
      onTap: onTap,
      borderRadius: circularRadius(2),
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: space(
                    [
                      SleepModeTimeDisplay(time: wakeUpTime.startTime),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: spacing(2),
                        color: context.theme.hintColor,
                      ),
                      SleepModeTimeDisplay(time: wakeUpTime.endTime),
                    ],
                    width: spacing(),
                  ),
                ),
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
