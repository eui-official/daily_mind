import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/features/mix/domain/mix_item_category.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class MixPlayerItemCategory extends HookWidget {
  final MixItemCategory itemCategory;

  const MixPlayerItemCategory({
    super.key,
    required this.itemCategory,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      final mixItems = itemCategory.mixItems;

      final items = mixItems.map((item) {
        return MixPlayerItem(item: item);
      });

      return space(
        items,
        height: spacing(4),
      );
    }, [itemCategory]);

    return BaseContentHeader(
      title: itemCategory.category.name,
      titleStyle: context.textTheme.titleSmall?.copyWith(
        color: context.theme.hintColor,
        fontWeight: FontWeight.bold,
      ),
      spacingSize: 3,
      child: Column(
        children: children,
      ),
    );
  }
}
