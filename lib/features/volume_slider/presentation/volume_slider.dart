import 'package:daily_mind/common_widgets/base_slider.dart';
import 'package:flutter/material.dart';

class VolumeSlider extends StatelessWidget {
  final ValueChanged<double> onVolumeChanged;
  final double initVolume;

  const VolumeSlider({
    super.key,
    required this.initVolume,
    required this.onVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSlider(
      value: initVolume,
      max: 1,
      divisions: 100,
      onChangeEnd: onVolumeChanged,
      onValueChanged: onVolumeChanged,
    );
  }
}
