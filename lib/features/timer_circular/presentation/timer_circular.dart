import 'dart:math';

import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerCircular extends StatelessWidget {
  final double percent;
  final Widget center;

  const TimerCircular({
    super.key,
    required this.center,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CircularPercentIndicator(
          radius: min(
            constraints.maxWidth,
            constraints.maxWidth * 0.35,
          ),
          lineWidth: spacing(3),
          percent: percent,
          animation: true,
          animateFromLastPercent: true,
          linearGradient: LinearGradient(
            colors: [
              maize,
              context.theme.primaryColor,
              celadon,
            ],
          ),
          center: center,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: context.theme.cardColor,
        );
      },
    );
  }
}
