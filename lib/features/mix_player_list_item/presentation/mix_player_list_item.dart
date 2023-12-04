import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class MixPlayerListItem extends StatelessWidget {
  final List<MixItem> mixItems;

  const MixPlayerListItem({
    super.key,
    required this.mixItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: space(
        mixItems.map((item) {
          return MixPlayerItem(item: item);
        }).toList(),
        height: spacing(5),
      ),
    );
  }
}
