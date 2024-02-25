import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SleepModeTimeSleep extends StatelessWidget {
  final int cycles;
  final Duration duration;

  const SleepModeTimeSleep({
    super.key,
    required this.cycles,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'ngủ ${duration.inHours} giờ, $cycles chu kỳ',
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.theme.hintColor,
      ),
    );
  }
}
