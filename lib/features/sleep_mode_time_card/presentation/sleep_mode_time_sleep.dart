import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SleepModeTimeSleep extends HookWidget {
  final int cycles;
  final Duration duration;

  const SleepModeTimeSleep({
    super.key,
    required this.cycles,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final hours = duration.inHours;
    final minutes = (duration.inMinutes % TimeOfDay.minutesPerHour) ~/ 6;

    final title = useMemoized(
      () {
        if (minutes > 0) {
          return 'Ngủ $hours.$minutes giờ, $cycles chu kỳ'.tr();
        } else {
          return 'Ngủ $hours giờ, $cycles chu kỳ'.tr();
        }
      },
      [hours, minutes, cycles],
    );

    return Text(
      title,
      style: context.textTheme.bodyLarge?.copyWith(
        color: context.theme.hintColor,
      ),
    );
  }
}
