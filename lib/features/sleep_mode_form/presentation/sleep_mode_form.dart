import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_times.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SleepModeForm extends StatelessWidget {
  const SleepModeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(spacing(2)),
      decoration: BoxDecoration(
        borderRadius: circularRadius(2),
        color: context.theme.cardColor,
      ),
      child: const Column(
        children: [
          SleepModeWakeUpTimes(),
        ],
      ),
    );
  }
}
