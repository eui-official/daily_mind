import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_time_display.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_time_slider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasePlayerTime extends HookWidget {
  final int position;
  final int max;
  final ValueChanged<Duration> onChangeEnd;

  const BasePlayerTime({
    super.key,
    required this.position,
    required this.max,
    required this.onChangeEnd,
  });

  @override
  Widget build(BuildContext context) {
    final trackValueState = useState<double>(0);

    final remainingTime = useMemoized(
      () => max - trackValueState.value,
      [
        max,
        trackValueState.value,
      ],
    );

    final child = useMemoized(() {
      return BasePlayerTimeSlider(
        max: max.toDouble(),
        onChangeEnd: onChangeEnd,
        value: position,
        onValueChanged: (value) {
          trackValueState.value = value;
        },
      );
    }, [
      position,
      max,
    ]);

    return Column(
      children: space(
        [
          BaseAnimatedSwitcher(child: child),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BasePlayerTimeDisplay(seconds: trackValueState.value.toInt()),
              BasePlayerTimeDisplay(seconds: remainingTime.toInt()),
            ],
          )
        ],
        height: spacing(2),
      ),
    );
  }
}
