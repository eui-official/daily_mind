import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseSliderTheme extends StatelessWidget {
  final Slider slider;

  const BaseSliderTheme({
    super.key,
    required this.slider,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: context.theme.primaryColor,
        showValueIndicator: ShowValueIndicator.always,
        overlayShape: SliderComponentShape.noOverlay,
        thumbShape: SliderComponentShape.noThumb,
        trackHeight: spacing(),
      ),
      child: slider,
    );
  }
}
