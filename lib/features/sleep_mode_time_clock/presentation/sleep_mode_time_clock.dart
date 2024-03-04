import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_total.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepModeTimeClock extends HookConsumerWidget {
  final ClockTimeFormat clockTimeFormat = ClockTimeFormat.twentyFourHours;
  final ClockIncrementTimeFormat clockIncrementTimeFormat =
      ClockIncrementTimeFormat.oneMin;

  const SleepModeTimeClock({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeTimeClockNotifier =
        ref.read(sleepModeTimeClockNotifierProvider.notifier);
    final sleepModeTimeClockState =
        ref.watch(sleepModeTimeClockNotifierProvider);

    final currentTime = useBaseDateTimeTicker();

    final duration = sleepModeTimeClockState.currentTime
        .difference(
          sleepModeTimeClockState.endTime,
        )
        .abs();

    return TimePicker(
      initTime: PickedTime(
        h: sleepModeTimeClockState.currentTime.hour,
        m: sleepModeTimeClockState.currentTime.minute,
      ),
      endTime: PickedTime(
        h: sleepModeTimeClockState.endTime.hour,
        m: sleepModeTimeClockState.endTime.minute,
      ),
      height: spacing(35),
      primarySectors: clockTimeFormat.value,
      secondarySectors: clockTimeFormat.value * 2,
      decoration: TimePickerDecoration(
        baseColor: context.theme.canvasColor.withOpacity(0.5),
        pickerBaseCirclePadding: spacing(2),
        sweepDecoration: TimePickerSweepDecoration(
          pickerStrokeWidth: spacing(4),
          pickerGradient: SweepGradient(
            colors: [
              context.theme.primaryColor,
              context.theme.primaryColorDark,
              context.theme.primaryColor,
            ],
            endAngle: pi,
            tileMode: TileMode.mirror,
          ),
          showConnector: true,
          connectorStrokeWidth: 2,
          connectorColor: context.theme.hintColor,
        ),
        initHandlerDecoration: TimePickerHandlerDecoration(
          shape: BoxShape.circle,
          radius: spacing(1.5),
          icon: Icon(
            Icons.bedtime_rounded,
            size: spacing(2.5),
            color: context.theme.primaryColorDark,
          ),
        ),
        endHandlerDecoration: TimePickerHandlerDecoration(
          shape: BoxShape.circle,
          radius: spacing(1.5),
          icon: Icon(
            Icons.notifications_rounded,
            size: spacing(2.5),
            color: context.theme.primaryColorDark,
          ),
        ),
        primarySectorsDecoration: TimePickerSectorDecoration(
          width: 1,
          size: 4,
          radiusPadding: spacing(3),
        ),
        secondarySectorsDecoration: TimePickerSectorDecoration(
          width: 1,
          size: 2,
          radiusPadding: spacing(3),
          color: context.theme.primaryColor,
        ),
        clockNumberDecoration: TimePickerClockNumberDecoration(
          textStyle: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.hintColor,
          ),
          positionFactor: 0.35,
          showNumberIndicators: true,
          clockTimeFormat: clockTimeFormat,
          clockIncrementTimeFormat: clockIncrementTimeFormat,
        ),
      ),
      onSelectionEnd: (start, end, valid) {
        sleepModeTimeClockNotifier.onUpdateEndTime(
          DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            end.h,
            end.m,
          ),
        );
      },
      onSelectionChange: (start, end, bool? valid) {
        sleepModeTimeClockNotifier.onUpdateCurrentTime(
          DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            start.h,
            start.m,
          ),
        );

        sleepModeTimeClockNotifier.onUpdateEndTime(
          DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            end.h,
            end.m,
          ),
        );
      },
      child: Center(
        child: SleepModeTimeClockTotal(duration: duration),
      ),
    );
  }
}
