import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixPlayerBackgroundFilter extends HookWidget {
  final List<MixItem> mixItems;

  const MixPlayerBackgroundFilter({
    super.key,
    required this.mixItems,
  });

  @override
  Widget build(BuildContext context) {
    final child = useMemoized(() {
      if (mixItems.isEmpty) {
        return kEmptyWidget;
      }

      final firstItem = mixItems.first;

      return BaseBackdropFilter(
        image: AssetImage(firstItem.offlineAudio.image),
      );
    }, [mixItems]);

    return BaseAnimatedSwitcher(child: child);
  }
}
