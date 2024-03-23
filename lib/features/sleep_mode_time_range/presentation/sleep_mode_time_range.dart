import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/extensions/date_time.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_box/presentation/sleep_mode_time_box.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_times.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeTimeRange extends HookConsumerWidget {
  const SleepModeTimeRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeTimeClockNoifier =
        ref.read(sleepModeTimeClockNotifierProvider.notifier);
    final sleepModeTimeClockState =
        ref.watch(sleepModeTimeClockNotifierProvider);

    final onSelectTimeWakeUp = useCallback(
      () async {
        final selectedTime = await showTimePicker(
          initialTime: TimeOfDay(
            hour: sleepModeTimeClockState.endTime.hour,
            minute: sleepModeTimeClockState.endTime.minute,
          ),
          context: context,
        );

        onSafeValueBuilder(selectedTime, (value) {
          final newTime = sleepModeTimeClockState.endTime.withHourAndMinute(
            hour: value.hour,
            minute: value.minute,
          );

          sleepModeTimeClockNoifier.onUpdateEndTime(newTime);
        });
      },
      [sleepModeTimeClockState],
    );

    return BaseSpacingContainerHorizontal(
      child: Column(
        children: space(
          [
            const SleepModeWakeUpTimes(),
            SleepModeTimeBox(
              onTap: onSelectTimeWakeUp,
              title: 'Thời gian thức dậy'.tr(),
              time: sleepModeTimeClockState.endTime,
            ),
          ],
          height: spacing(),
        ),
      ),
    );
  }
}
