import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BasePlayerTime extends StatelessWidget {
  final int value;
  final int max;
  final ValueChanged<double> onChangeEnd;
  final ValueChanged<double> onChanged;

  const BasePlayerTime({
    super.key,
    required this.value,
    required this.max,
    required this.onChanged,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: spacing()),
      ),
      child: Slider(
        divisions: 1,
        max: max.toDouble(),
        min: 0,
        onChanged: onChanged,
        onChangeEnd: onChangeEnd,
        value: value.toDouble(),
      ),
    );
  }
}
