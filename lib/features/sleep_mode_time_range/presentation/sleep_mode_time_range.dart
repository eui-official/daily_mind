import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/extensions/date_time.dart';
import 'package:daily_mind/features/sleep_mode_time_box/presentation/sleep_mode_time_box.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_times.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeTimeRange extends HookConsumerWidget {
  final DateTime endTime;
  final ValueChanged<DateTime> onEndTimeChanged;

  const SleepModeTimeRange({
    super.key,
    required this.endTime,
    required this.onEndTimeChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onSelectTimeWakeUp = useCallback(
      () async {
        final selectedTime = await showTimePicker(
          initialTime: TimeOfDay(
            hour: endTime.hour,
            minute: endTime.minute,
          ),
          context: context,
        );

        onSafeValueBuilder(selectedTime, (value) {
          final newTime = endTime.withHourAndMinute(
            hour: value.hour,
            minute: value.minute,
          );

          onEndTimeChanged(newTime);
        });
      },
      [endTime],
    );

    return BaseSpacingContainerHorizontal(
      child: Column(
        children: space(
          [
            SleepModeWakeUpTimes(onEndTimeChanged: onEndTimeChanged),
            SleepModeTimeBox(
              onTap: onSelectTimeWakeUp,
              title: 'Thời gian thức dậy'.tr(),
              time: endTime,
            ),
          ],
          height: spacing(),
        ),
      ),
    );
  }
}
