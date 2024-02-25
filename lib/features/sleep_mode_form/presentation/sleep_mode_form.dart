import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_times.dart';
import 'package:flutter/material.dart';

class SleepModeForm extends StatelessWidget {
  const SleepModeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SleepModeWakeUpTimes(),
      ],
    );
  }
}
