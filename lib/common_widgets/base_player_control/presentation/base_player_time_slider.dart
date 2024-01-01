import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_slider_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class BasePlayerTimeSlider extends HookWidget {
  final double max;
  final int value;
  final ValueChanged<double> onValueChanged;
  final ValueChanged<Duration> onChangeEnd;

  const BasePlayerTimeSlider({
    super.key,
    required this.max,
    required this.onChangeEnd,
    required this.onValueChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final isChanging = useState(false);
    final trackState = useState<double>(0);

    final onSliderChangedEnd = useCallback(
      (double value) {
        final duration = value.seconds;

        isChanging.value = false;
        onChangeEnd(duration);
      },
      [],
    );

    final onSliderChanged = useCallback(
      (double value) {
        trackState.value = value;
      },
      [],
    );

    final onSliderChangeStart = useCallback((double value) {
      isChanging.value = true;
      trackState.value = value;
    }, []);

    useEffectDelayed(() {
      onValueChanged(trackState.value);
    }, [trackState.value]);

    useEffectDelayed(() {
      trackState.value = value.toDouble();
    }, [value]);

    return BaseSliderTheme(
      isChanging: isChanging.value,
      slider: Slider(
        max: max.toDouble(),
        min: 0,
        onChanged: onSliderChanged,
        onChangeEnd: onSliderChangedEnd,
        onChangeStart: onSliderChangeStart,
        secondaryTrackValue: trackState.value.toDouble(),
        value: trackState.value,
      ),
    );
  }
}
