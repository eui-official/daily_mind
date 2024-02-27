import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/domain/wake_up_time.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeWakeUpAvailable extends HookWidget {
  final ScrollController controller;
  final List<WakeUpTime> wakeUpTimes;
  final ValueChanged<WakeUpTime> onSelect;

  const SleepModeWakeUpAvailable({
    super.key,
    required this.controller,
    required this.onSelect,
    required this.wakeUpTimes,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      return wakeUpTimes.reversed.map((wakeUpTime) {
        final isShowRecommended = wakeUpTime == wakeUpTimes.last;

        return SleepModeTimeCard(
          onTap: () => onSelect(wakeUpTime),
          isShowRecommended: isShowRecommended,
          wakeUpTime: wakeUpTime,
        );
      });
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
