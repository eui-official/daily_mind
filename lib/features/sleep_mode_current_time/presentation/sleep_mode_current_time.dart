import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepModeCurrentTime extends HookWidget {
  const SleepModeCurrentTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentTime = useBaseDateTimeTicker();
    ClockTimeFormat clockTimeFormat = ClockTimeFormat.twelveHours;
    ClockIncrementTimeFormat clockIncrementTimeFormat =
        ClockIncrementTimeFormat.oneMin;

    return TimePicker(
      initTime: PickedTime(
        h: currentTime.hour,
        m: currentTime.minute,
      ),
      endTime: PickedTime(h: 8, m: 0),
      primarySectors: clockTimeFormat.value,
      secondarySectors: clockTimeFormat.value * 2,
      decoration: TimePickerDecoration(
        baseColor: context.theme.primaryColor,
        pickerBaseCirclePadding: spacing(4),
        sweepDecoration: TimePickerSweepDecoration(
          pickerStrokeWidth: spacing(2),
          pickerGradient: SweepGradient(
            colors: [
              context.theme.colorScheme.primary,
              context.theme.colorScheme.background,
            ],
            endAngle: pi,
            tileMode: TileMode.mirror,
          ),
        ),
        initHandlerDecoration: TimePickerHandlerDecoration(
          icon: Icon(
            Icons.bedtime_rounded,
            size: spacing(3),
          ),
        ),
        endHandlerDecoration: TimePickerHandlerDecoration(
          icon: Icon(
            Icons.notifications_rounded,
            size: spacing(3),
          ),
        ),
        primarySectorsDecoration: TimePickerSectorDecoration(
          size: 4,
          radiusPadding: spacing(3),
        ),
        secondarySectorsDecoration: TimePickerSectorDecoration(
          size: 2,
          radiusPadding: spacing(3),
        ),
        clockNumberDecoration: TimePickerClockNumberDecoration(
          textStyle: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          clockIncrementHourFormat: ClockIncrementHourFormat.one,
          positionFactor: 0.25,
          showNumberIndicators: true,
          clockTimeFormat: clockTimeFormat,
          clockIncrementTimeFormat: clockIncrementTimeFormat,
        ),
      ),
      onSelectionChange: (start, end, isDisableRange) => print(
          'onSelectionChange => init : ${start.h}:${start.m}, end : ${end.h}:${end.m}, isDisableRangeRange: $isDisableRange'),
      onSelectionEnd: (start, end, isDisableRange) => print(
          'onSelectionEnd => init : ${start.h}:${start.m}, end : ${end.h}:${end.m},, isDisableRangeRange: $isDisableRange'),
    );
  }
}
