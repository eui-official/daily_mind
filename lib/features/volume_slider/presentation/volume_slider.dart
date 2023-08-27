import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VolumeSlider extends HookWidget {
  final ValueChanged<double> onChanged;
  final double initVolume;

  const VolumeSlider({
    super.key,
    required this.initVolume,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final volume = useState(initVolume);

    return Row(
      children: [
        const Icon(Icons.volume_up),
        Expanded(
          child: Slider(
            value: volume.value.toDouble(),
            min: 0,
            max: 1,
            divisions: 100,
            onChanged: (value) {
              volume.value = value;
              onChanged(value);
            },
          ),
        )
      ],
    );
  }
}
