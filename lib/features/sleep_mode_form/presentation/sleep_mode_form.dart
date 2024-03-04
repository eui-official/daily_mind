import 'package:blur/blur.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class SleepModeForm extends StatelessWidget {
  const SleepModeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container().blurred(
              blurColor: context.theme.cardColor,
              borderRadius: circularRadius(2),
            ),
          ),
          const Column(
            children: [],
          ),
        ],
      ),
    );
  }
}
