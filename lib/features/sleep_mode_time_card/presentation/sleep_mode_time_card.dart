import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_dropdown_selector_card.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_display.dart';
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
  final Widget? icon;

  const SleepModeTimeCard({
    super.key,
    required this.wakeUpTime,
    this.isShowRecommended = false,
    this.color,
    this.decoration,
    this.onTap,
    this.padding,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final duration = wakeUpTime.endTime.difference(wakeUpTime.startTime);

    return BaseDropdownSelectorCard(
      color: color,
      onTap: onTap,
      icon: icon,
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
        ].whereNotNull().toList(),
      ),
    );
  }
}
