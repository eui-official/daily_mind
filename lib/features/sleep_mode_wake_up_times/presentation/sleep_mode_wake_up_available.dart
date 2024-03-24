import 'package:daily_mind/common_providers/wake_up_times_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_recommended.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeWakeUpAvailable extends HookConsumerWidget {
  final ScrollController controller;
  final ValueChanged<WakeUpTime> onSelect;

  const SleepModeWakeUpAvailable({
    super.key,
    required this.controller,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wakeUpTimes = ref.watch(wakeUpTimesNotifierProvider);

    final children = useMemoized(() {
      return wakeUpTimes.reversed.map(
        (wakeUpTime) {
          final isShowRecommended = wakeUpTime == wakeUpTimes.last;

          return SleepModeTimeCard(
            decoration: BoxDecoration(
              borderRadius: circularRadius(2),
            ),
            onTap: () => onSelect(wakeUpTime),
            icon: isShowRecommended
                ? const SleepModeTimeRecommended()
                : kEmptyWidget,
            wakeUpTime: wakeUpTime,
          );
        },
      );
    }, [wakeUpTimes]);

    return ListView(
      padding: EdgeInsets.all(spacing(2)),
      controller: controller,
      children: space(
        children,
        height: spacing(2),
      ),
    );
  }
}
