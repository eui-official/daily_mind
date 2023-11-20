import 'package:daily_mind/features/timer_circular/presentation/timer_circular.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

class TimerCircularAnimate extends StatelessWidget {
  final double percent;
  final Widget center;
  final bool animate;

  const TimerCircularAnimate({
    super.key,
    required this.center,
    required this.percent,
    this.animate = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            context.theme.primaryColor,
            BlendMode.srcIn,
          ),
          child: Lottie.asset(
            'assets/lottie/circle.json',
            animate: animate,
            width: context.width * 0.7,
          ),
        ),
        TimerCircular(
          center: center,
          percent: percent,
        ),
      ],
    );
  }
}
