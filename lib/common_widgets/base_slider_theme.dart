import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class BaseSliderTheme extends HookWidget {
  final Widget slider;
  final bool isChanging;

  const BaseSliderTheme({
    super.key,
    required this.slider,
    this.isChanging = false,
  });

  @override
  Widget build(BuildContext context) {
    final trackHeight = useMemoized(() {
      if (isChanging) {
        return spacing(4);
      }

      return spacing(2);
    }, [isChanging]);

    return AnimatedContainer(
      duration: kShortDuration,
      height: trackHeight,
      child: SliderTheme(
        data: SliderThemeData(
          activeTrackColor: context.theme.primaryColor,
          inactiveTrackColor: context.theme.primaryColorLight.withOpacity(0.4),
          showValueIndicator: ShowValueIndicator.always,
          overlayShape: SliderComponentShape.noOverlay,
          thumbShape: SliderComponentShape.noThumb,
          tickMarkShape: SliderTickMarkShape.noTickMark,
          trackShape: const RoundedRectSliderTrackShape(),
          trackHeight: trackHeight,
        ),
        child: ClipRRect(
          borderRadius: circularRadius(2),
          child: slider,
        ),
      ),
    );
  }
}
