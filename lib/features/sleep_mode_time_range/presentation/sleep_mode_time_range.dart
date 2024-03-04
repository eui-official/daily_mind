import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_box/presentation/sleep_mode_time_box.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeTimeRange extends HookConsumerWidget {
  const SleepModeTimeRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeTimeClockState =
        ref.watch(sleepModeTimeClockNotifierProvider);

    return BaseSpacingContainerHorizontal(
      child: Row(
        children: space(
          [
            Expanded(
              child: SleepModeTimeBox(
                onTap: () {},
                title: 'Thời gian ngủ'.tr(),
                time: sleepModeTimeClockState.currentTime,
              ),
            ),
            Expanded(
              child: SleepModeTimeBox(
                onTap: () {},
                title: 'Thức dậy'.tr(),
                time: sleepModeTimeClockState.endTime,
              ),
            ),
          ],
          width: spacing(),
        ),
      ),
    );
  }
}
