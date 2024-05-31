import 'package:daily_mind/features/sleep_mode/presentation/sleep_mode_provider.dart';
import 'package:daily_mind/features/sleep_mode_list_alarm/presentation/sleep_mode_list_alarm_provider.dart';
import 'package:daily_mind/features/sleep_mode_list_alarm_item/presentation/sleep_mode_list_alarm_item.dart';
import 'package:daily_mind/features/sleep_mode_tracker/presentation/sleep_mode_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SleepModeListAlarm extends HookConsumerWidget {
  const SleepModeListAlarm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeListAlarmState =
        ref.watch(sleepModeListAlarmNotifierProvider);
    final sleepModeListAlarmNotifier =
        ref.read(sleepModeListAlarmNotifierProvider.notifier);
    final sleepModeState = ref.watch(sleepModeNotifierProvider);

    final children = useMemoized(
      () {
        return sleepModeListAlarmState.alarmHistories.map((alarmHistory) {
          return SleepModeListAlarmItem(
            alarmHistory: alarmHistory,
            onTap: (alarmHistory) {
              if (alarmHistory.id ==
                  sleepModeListAlarmState.selectedAlarmHistory?.id) {
                pushNewScreen(
                  context,
                  screen: SleepModeTracker(sleepModeState: sleepModeState),
                  withNavBar: false,
                );
              }
            },
            onStartAlarmHistory: sleepModeListAlarmNotifier.onStartAlarm,
            onStopAlarmHistory: sleepModeListAlarmNotifier.onStopAlarm,
            selectedId: sleepModeListAlarmState.selectedAlarmHistory?.id,
          );
        }).toList();
      },
      [sleepModeListAlarmState, sleepModeState],
    );

    return ListView(
      shrinkWrap: true,
      children: children,
    );
  }
}
