import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

const backgroundColor = Color(0xFFF15BB5);

const colors = [
  Color(0xFFFEE440),
  Color(0xFF00BBF9),
];

const durations = [
  5000,
  4000,
];

const heightPercentages = [
  0.65,
  0.66,
];

class SleepModeCurrentTime extends HookWidget {
  const SleepModeCurrentTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentTime = useBaseDateTimeTicker();
    ClockTimeFormat clockTimeFormat = ClockTimeFormat.twentyFourHours;
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
        baseColor: context.theme.primaryColorDark,
        pickerBaseCirclePadding: spacing(2),
        sweepDecoration: TimePickerSweepDecoration(
          pickerStrokeWidth: spacing(2),
          pickerColor: context.theme.focusColor,
        ),
        initHandlerDecoration: TimePickerHandlerDecoration(
          color: context.theme.primaryColor,
          icon: const Icon(Icons.power_settings_new_outlined),
          radius: spacing(),
          shape: BoxShape.circle,
        ),
        endHandlerDecoration: TimePickerHandlerDecoration(
          color: context.theme.primaryColor,
          icon: const Icon(Icons.notifications_active_outlined),
          radius: spacing(),
          shape: BoxShape.circle,
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
          scaleFactor: 2,
          positionFactor: 0.2,
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
