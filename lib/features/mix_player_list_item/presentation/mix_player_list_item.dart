import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
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
    return ListView.separated(
      itemCount: mixItems.length,
      separatorBuilder: (context, index) => SizedBox(
        height: spacing(4),
      ),
      itemBuilder: (context, index) {
        final item = mixItems[index];

        return MixPlayerItem(item: item);
      },
    );
  }
}
