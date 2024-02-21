import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

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

class SleepModeStartButton extends StatelessWidget {
  const SleepModeStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.height * 0.3;

    return BaseInkWell(
      child: Stack(
        alignment: Alignment.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              context.theme.primaryColor,
              BlendMode.modulate,
            ),
            child: Container(
              alignment: Alignment.center,
              constraints: BoxConstraints(maxHeight: size, maxWidth: size),
              child: Lottie.asset('assets/lottie/circle.json'),
            ),
          ),
        ],
      ),
    );
  }
}
