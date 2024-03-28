import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/extensions/date_time.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_total.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepModeTimeClock extends HookConsumerWidget {
  final DateTime endTime;
  final ValueChanged<DateTime> onEndTimeChanged;

  final ClockTimeFormat clockTimeFormat = ClockTimeFormat.twentyFourHours;
  final ClockIncrementTimeFormat clockIncrementTimeFormat =
      ClockIncrementTimeFormat.oneMin;

  const SleepModeTimeClock({
    super.key,
    required this.endTime,
    required this.onEndTimeChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Duration duration = endTime.onGetDurationDifference(DateTime.now());

    final currentTime = useBaseDateTimeTicker();

    final colors = useMemoized(() {
      if (duration == Duration.zero) {
        return [
          context.theme.colorScheme.error,
          context.theme.colorScheme.error.withOpacity(0.5),
          context.theme.colorScheme.error.withOpacity(0.2),
        ];
      }

      return [
        context.theme.primaryColor,
        context.theme.primaryColorDark,
        context.theme.primaryColor,
      ];
    }, [duration]);

    return TimePicker(
      initTime: DateTime.now().toPickedTime,
      endTime: endTime.toPickedTime,
      height: spacing(30),
      primarySectors: clockTimeFormat.value,
      secondarySectors: clockTimeFormat.value * 2,
      decoration: TimePickerDecoration(
        baseColor: context.theme.canvasColor.withOpacity(0.5),
        pickerBaseCirclePadding: spacing(1.5),
        sweepDecoration: TimePickerSweepDecoration(
          pickerStrokeWidth: spacing(3),
          pickerGradient: SweepGradient(
            colors: colors,
            endAngle: pi,
            tileMode: TileMode.mirror,
          ),
          showConnector: true,
          connectorStrokeWidth: 2,
          connectorColor: context.theme.hintColor,
        ),
        initHandlerDecoration: TimePickerHandlerDecoration(
          shape: BoxShape.circle,
          radius: spacing(2),
          icon: Icon(
            Icons.bedtime_rounded,
            size: spacing(2.5),
            color: context.theme.primaryColorDark,
          ),
        ),
        endHandlerDecoration: TimePickerHandlerDecoration(
          shape: BoxShape.circle,
          radius: spacing(2),
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
          positionFactor: 0.25,
          showNumberIndicators: true,
          clockTimeFormat: clockTimeFormat,
          clockIncrementTimeFormat: clockIncrementTimeFormat,
        ),
      ),
      onSelectionEnd: (start, end, valid) {
        final newEndTime = currentTime.withHourAndMinute(
          hour: end.h,
          minute: end.m,
        );

        onEndTimeChanged(newEndTime);
      },
      onSelectionChange: (start, end, bool? valid) {
        final newEndTime = currentTime.withHourAndMinute(
          hour: end.h,
          minute: end.m,
        );

        onEndTimeChanged(newEndTime);
      },
      child: Center(
        child: SleepModeTimeClockTotal(duration: duration),
      ),
    );
  }
}
