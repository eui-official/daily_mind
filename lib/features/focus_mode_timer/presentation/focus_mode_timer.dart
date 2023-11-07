import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:timer_count_down/timer_count_down.dart';

class FocusModeTimer extends StatelessWidget {
  const FocusModeTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Countdown(
      seconds: 1500,
      interval: const Duration(seconds: 1),
      build: (context, time) {
        return Text(
          time.toString(),
          style: context.textTheme.displayLarge,
        );
      },
    );
  }
}
