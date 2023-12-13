import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_slider_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasePlayerTimeSlider extends HookWidget {
  final double max;
  final int value;
  final ValueChanged<Duration> onChangeEnd;
  final ValueChanged<double> onValueChanged;

  const BasePlayerTimeSlider({
    super.key,
    required this.value,
    required this.max,
    required this.onChangeEnd,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isChanging = useState(false);
    final trackValueState = useState<double>(0);

    final onSliderChangedEnd = useCallback(
      (double seconds) {
        final position = Duration(seconds: seconds.toInt());

        isChanging.value = false;
        onChangeEnd(position);
      },
      [onChangeEnd],
    );

    final onSliderChanged = useCallback(
      (double seconds) {
        trackValueState.value = seconds;
      },
      [],
    );

    final onSliderChangeStart = useCallback((double seconds) {
      isChanging.value = true;
    }, []);

    useEffectDelayed(() {
      onValueChanged(trackValueState.value);
    }, [trackValueState.value]);

    useEffectDelayed(() {
      trackValueState.value = value.toDouble();
    }, [value]);

    return BaseSliderTheme(
      isChanging: isChanging.value,
      slider: Slider(
        max: max.toDouble(),
        min: 0,
        onChanged: onSliderChanged,
        onChangeStart: onSliderChangeStart,
        onChangeEnd: onSliderChangedEnd,
        value: trackValueState.value.toDouble(),
        secondaryTrackValue: value.toDouble(),
      ),
    );
  }
}