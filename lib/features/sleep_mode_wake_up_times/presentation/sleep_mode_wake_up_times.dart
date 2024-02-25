import 'package:daily_mind/features/sleep_mode_time_card/presentation/sleep_mode_time_card.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/hook/useWakeupTimes.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeWakeUpTimes extends HookWidget {
  const SleepModeWakeUpTimes({super.key});

  @override
  Widget build(BuildContext context) {
    final wakeUpTimes = useWakeUpTimes();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: SleepModeTimeCard(wakeUpTime: wakeUpTimes.last),
    );
  }
}
