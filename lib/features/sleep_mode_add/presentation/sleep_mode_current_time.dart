import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/features/sleep_mode_time_ticker/presentation/sleep_mode_time_ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';

const backgroundColor = Color(0xFFF15BB5);

const colors = [
  Color(0xFFFEE440),
  Color(0xFF00BBF9),
];

const durations = [
  5000,
  4000,
];

const heightPercentages = [
  0.65,
  0.66,
];

class SleepModeCurrentTime extends HookWidget {
  const SleepModeCurrentTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController()
      ..duration = const Duration(seconds: 8)
      ..repeat();

    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            context.theme.primaryColor,
            BlendMode.modulate,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Lottie.asset(
              'assets/lotties/circle.json',
              controller: controller,
              frameRate: const FrameRate(60),
              height: context.height * 0.3,
            ),
          ),
        ),
        const SleepModeTimeTicker(),
      ],
    );
  }
}
