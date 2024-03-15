import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_providers/wake_up_times_provider.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_skeleton_box.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/extensions/theme.dart';
import 'package:daily_mind/features/sleep_mode_time_clock/presentation/sleep_mode_time_clock_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_available.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_provider.dart';
import 'package:easy_localization/easy_localization.dart';
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

    final onSelect = useCallback(
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

    return BaseSpacingContainerHorizontal(
      child: BaseContentHeader(
        title: 'Ngủ theo chu kỳ'.tr(),
        child: wakeUpTimes.isNotEmpty
            ? SleepModeTimeCard(
                color: context.theme.menuBackground,
                onTap: onSelect,
                padding: padding,
                wakeUpTime: wakeUpTimeSelected,
              )
            : const BaseSkeletonBox(),
      ),
    );
  }
}
