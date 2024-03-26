import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/sleep_mode/presentation/sleep_mode_provider.dart';
import 'package:daily_mind/features/sleep_mode_tracker/presentation/sleep_mode_tracker.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock.dart';
import 'package:daily_mind/features/sleep_mode_time_range/presentation/sleep_mode_time_range.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_audios/presentation/sleep_mode_wake_up_audios.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SleepMode extends HookConsumerWidget {
  const SleepMode({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeState = ref.watch(sleepModeNotifierProvider);
    final sleepModeNotifier = ref.read(sleepModeNotifierProvider.notifier);

    final greeting = useMemoized(
      () {
        final hour = DateTime.now().toUtc().hour;

        if (hour < 12) {
          return 'Chào buổi sáng'.tr();
        }
        if (hour < 17) {
          return 'Chào buổi trưa'.tr();
        }
        return 'Chào buổi tối'.tr();
      },
      [],
    );

    final onStartSleeping = useCallback(
      () {
        sleepModeNotifier.onStartAlarm();

        pushNewScreen(
          context,
          withNavBar: false,
          screen: SleepModeTracker(sleepModeState: sleepModeState),
        );
      },
      [sleepModeState],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AppBarScrollview(
            title: greeting,
            children: space(
              [
                SleepModeTimeRange(
                  endTime: sleepModeState.endTime,
                  onEndTimeChanged: sleepModeNotifier.onEndTimeChanged,
                ),
                SleepModeTimeClock(
                  endTime: sleepModeState.endTime,
                  onEndTimeChanged: sleepModeNotifier.onEndTimeChanged,
                ),
                SleepModeWakeUpAudios(
                  selectedOfflineAudio: sleepModeState.wakeUpOfflineAudio,
                  onChanged: sleepModeNotifier.onWakeUpOfflineAudioChanged,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: onStartSleeping,
                    child: Text('Bắt đầu ngủ'.tr()),
                  ),
                ),
              ],
              height: spacing(5),
            ),
          ),
        ],
      ),
    );
  }
}
