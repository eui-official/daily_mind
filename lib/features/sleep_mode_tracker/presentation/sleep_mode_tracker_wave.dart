import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SleepModeTrackerWave extends StatelessWidget {
  const SleepModeTrackerWave({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = context.theme.colorScheme.background;

    final colors = [
      context.theme.primaryColorDark.withOpacity(0.2),
      context.theme.primaryColor.withOpacity(0.1),
    ];

    final durations = [
      30000,
      15000,
    ];

    final heightPercentages = [
      0.7,
      0.8,
    ];

    return WaveWidget(
      config: CustomConfig(
        colors: colors,
        durations: durations,
        heightPercentages: heightPercentages,
      ),
      backgroundColor: backgroundColor,
      size: const Size(double.infinity, double.infinity),
    );
  }
}
