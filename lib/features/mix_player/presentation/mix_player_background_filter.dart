import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:flutter/material.dart';

class MixPlayerBackgroundFilter extends StatelessWidget {
  final List<MixItem> mixItems;

  const MixPlayerBackgroundFilter({
    super.key,
    required this.mixItems,
  });

  @override
  Widget build(BuildContext context) {
    final firstItem = mixItems.first;

    return BaseBackdropFilter(image: AssetImage(firstItem.audio.image));
  }
}
