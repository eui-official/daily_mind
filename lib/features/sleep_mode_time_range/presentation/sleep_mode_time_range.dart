import 'package:daily_mind/features/sleep_mode_time/presentation/sleep_mode_time_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_box/presentation/sleep_mode_time_box.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeTimeRange extends HookConsumerWidget {
  const SleepModeTimeRange({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeTimeState = ref.watch(sleepModeTimeNotifierProvider);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SleepModeTimeBox(
            onTap: () {},
            title: 'Thời gian ngủ'.tr(),
            time: sleepModeTimeState.currentTime,
          ),
          SleepModeTimeBox(
            onTap: () {},
            title: 'Thức dậy'.tr(),
            time: sleepModeTimeState.endTime,
          ),
        ],
      ),
    );
  }
}
