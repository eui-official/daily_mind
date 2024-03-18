import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_providers/wake_up_times_provider.dart';
import 'package:daily_mind/common_widgets/base_skeleton_box.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/extensions/theme.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_available.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeWakeUpTimes extends HookConsumerWidget {
  final EdgeInsetsGeometry? padding;

  const SleepModeWakeUpTimes({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeWakeUpNotifier =
        ref.read(sleepModeWakeUpNotifierProvider.notifier);
    final sleepModeWakeUpState = ref.watch(sleepModeWakeUpNotifierProvider);

    final sleepModeTimeClockNotifier =
        ref.read(sleepModeTimeClockNotifierProvider.notifier);
    final sleepModeTimeClockState =
        ref.watch(sleepModeTimeClockNotifierProvider);
    final wakeUpTimes = ref.watch(wakeUpTimesNotifierProvider);

    final wakeUpTimeSelected = useMemoized(
      () {
        return wakeUpTimes[sleepModeWakeUpState];
      },
      [wakeUpTimes, sleepModeTimeClockState],
    );

    final onUseRecommended = useCallback(
      () {
        final wakeUpTime = wakeUpTimes.last;
        final index = wakeUpTimes.onGetWakeUpTimeIndex(wakeUpTime);

        sleepModeWakeUpNotifier.onUpdateIndex(index);
        sleepModeTimeClockNotifier.onUpdateStartTime(wakeUpTime.startTime);
        sleepModeTimeClockNotifier.onUpdateEndTime(wakeUpTime.endTime);
      },
      [wakeUpTimes],
    );

    final onSelectWakeUpTime = useCallback(
      () {
        onShowScrollableBottomSheet(
          context,
          initialChildSize: 0.75,
          builder: (context, controller) {
            return SleepModeWakeUpAvailable(
              onSelect: (wakeUpTime) {
                final index = wakeUpTimes.onGetWakeUpTimeIndex(wakeUpTime);

                sleepModeWakeUpNotifier.onUpdateIndex(index);

                sleepModeTimeClockNotifier
                    .onUpdateStartTime(wakeUpTime.startTime);
                sleepModeTimeClockNotifier.onUpdateEndTime(wakeUpTime.endTime);

                context.pop();
              },
              controller: controller,
            );
          },
        );
      },
      [wakeUpTimes],
    );

    useEffectDelayed(() {
      onUseRecommended();
    }, []);

    return wakeUpTimes.isNotEmpty
        ? SleepModeTimeCard(
            color: context.theme.menuBackground,
            onTap: onSelectWakeUpTime,
            padding: padding,
            wakeUpTime: wakeUpTimeSelected,
          )
        : const BaseSkeletonBox();
  }
}
