import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_datetime_builder/hook/useBaseDateTimeTicker.dart';
import 'package:daily_mind/features/sleep_mode_time/presentation/sleep_mode_time_provider.dart';
import 'package:daily_mind/features/sleep_mode_time/presentation/sleep_mode_time_total.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:progressive_time_picker/progressive_time_picker.dart';

class SleepModeCurrentTime extends HookConsumerWidget {
  final ClockTimeFormat clockTimeFormat = ClockTimeFormat.twentyFourHours;
  final ClockIncrementTimeFormat clockIncrementTimeFormat =
      ClockIncrementTimeFormat.oneMin;

  const SleepModeCurrentTime({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeCurrentTimeNotifier =
        ref.read(sleepModeTimeNotifierProvider.notifier);
    final sleepModeCurrentTimeState = ref.watch(sleepModeTimeNotifierProvider);

    final currentTime = useBaseDateTimeTicker();

    final duration = sleepModeCurrentTimeState.currentTime
        .difference(
          sleepModeCurrentTimeState.endTime,
        )
        .abs();

    return TimePicker(
      drawInitHandlerOnTop: true,
      initTime: PickedTime(
        h: sleepModeCurrentTimeState.currentTime.hour,
        m: sleepModeCurrentTimeState.currentTime.minute,
      ),
      endTime: PickedTime(
        h: sleepModeCurrentTimeState.endTime.hour,
        m: sleepModeCurrentTimeState.endTime.minute,
      ),
      height: context.height / 3,
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
        sleepModeCurrentTimeNotifier.onUpdateEndTime(
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
        sleepModeCurrentTimeNotifier.onUpdateCurrentTime(
          DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            start.h,
            start.m,
          ),
        );

        sleepModeCurrentTimeNotifier.onUpdateEndTime(
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
        child: SleepModeTimeTotal(duration: duration),
      ),
    );
  }
}
