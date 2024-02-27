import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/hook/useWakeupTimes.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeWakeUpTimes extends HookWidget {
  final EdgeInsetsGeometry? padding;

  const SleepModeWakeUpTimes({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final wakeUpTimes = useWakeUpTimes();

    final onSelect = useCallback(
      () {
        onShowScrollableBottomSheet(
          context,
          initialChildSize: 0.75,
          builder: (context, controller) {
            return SleepModeWakeUpAvailable(
              onSelect: (wakeUpTime) {},
              controller: controller,
              wakeUpTimes: wakeUpTimes,
            );
          },
        );
      },
      [wakeUpTimes],
    );

    return SleepModeTimeCard(
      onTap: onSelect,
      padding: padding,
      trailing: const Icon(Icons.keyboard_arrow_down_rounded),
      wakeUpTime: wakeUpTimes.last,
    );
  }
}
