import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VolumeSlider extends HookWidget {
  final ValueChanged<double> onVolumeChanged;
  final double initVolume;

  const VolumeSlider({
    super.key,
    required this.initVolume,
    required this.onVolumeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final volume = useState(initVolume);

    return RotatedBox(
      quarterTurns: 1,
      child: SliderTheme(
        data: SliderThemeData(
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: spacing()),
        ),
        child: Slider(
          value: volume.value.toDouble(),
          min: 0,
          max: 1,
          divisions: 100,
          onChanged: (value) {
            volume.value = value;
            onVolumeChanged(value);
          },
        ),
      ),
    );
  }
}
