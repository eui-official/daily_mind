import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_providers/wake_up_times_provider.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_skeleton_box.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/extensions/theme.dart';
import 'package:daily_mind/features/sleep_mode_time/presentation/sleep_mode_time_provider.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_available.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_provider.dart';
import 'package:daily_mind/theme/theme.dart';
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

    final sleepModeTimeNotifier =
        ref.read(sleepModeTimeNotifierProvider.notifier);
    final sleepModeTimeState = ref.watch(sleepModeTimeNotifierProvider);
    final wakeUpTimes = ref.watch(wakeUpTimesNotifierProvider);

    final wakeUpTimeSelected = useMemoized(
      () {
        return wakeUpTimes[sleepModeWakeUpState];
      },
      [wakeUpTimes, sleepModeTimeState],
    );

    final onUseRecommended = useCallback(
      () {
        final wakeUpTime = wakeUpTimes.last;
        final index = wakeUpTimes.onGetWakeUpTimeIndex(wakeUpTime);

        sleepModeWakeUpNotifier.onUpdateIndex(index);
        sleepModeTimeNotifier.onUpdateCurrentTime(wakeUpTime.startTime);
        sleepModeTimeNotifier.onUpdateEndTime(wakeUpTime.endTime);
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

                sleepModeTimeNotifier.onUpdateCurrentTime(wakeUpTime.startTime);
                sleepModeTimeNotifier.onUpdateEndTime(wakeUpTime.endTime);

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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: BaseContentHeader(
        title: 'Ngủ theo chu kỳ'.tr(),
        child: wakeUpTimes.isNotEmpty
            ? SleepModeTimeCard(
                color: context.theme.menuBackground,
                onTap: onSelect,
                padding: padding,
                trailing: const Icon(Icons.keyboard_arrow_down_rounded),
                wakeUpTime: wakeUpTimeSelected,
              )
            : const BaseSkeletonBox(),
      ),
    );
  }
}
