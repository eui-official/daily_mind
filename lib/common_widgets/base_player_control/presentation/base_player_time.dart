import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class BasePlayerTime extends HookWidget {
  final int value;
  final int max;
  final ValueChanged<Duration> onChangeEnd;

  const BasePlayerTime({
    super.key,
    required this.value,
    required this.max,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final isChanging = useState(false);
    final trackValueState = useState<double>(0);

    final onUpdatedSlider = useCallback(() {
      if (isChanging.value) return;

      trackValueState.value = value.toDouble();
    }, [isChanging, value]);

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

    useEffect(() {
      onUpdatedSlider();

      return () {};
    }, [value, onUpdatedSlider]);

    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: context.theme.primaryColor,
        showValueIndicator: ShowValueIndicator.always,
        thumbShape: SliderComponentShape.noThumb,
      ),
      child: Slider(
        max: max.toDouble(),
        min: 0,
        onChanged: onSliderChanged,
        onChangeStart: onSliderChangeStart,
        onChangeEnd: onSliderChangedEnd,
        value: trackValueState.value.toDouble(),
        label: dateFormatter
            .onFormatDuration(Duration(seconds: trackValueState.value.toInt())),
      ),
    );
  }
}
