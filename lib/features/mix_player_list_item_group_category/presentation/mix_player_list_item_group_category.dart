import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix_player_item_category/presentation/mix_player_item_category.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixPlayerListItemGroupCategory extends HookWidget {
  final List<MixItem> mixItems;

  const MixPlayerListItemGroupCategory({
    super.key,
    required this.mixItems,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      final mixItemCategories = mixItems.toGetMixItemCategories;

      final itemCategories = mixItemCategories.map((itemCategory) {
        return MixPlayerItemCategory(itemCategory: itemCategory);
      });

      return space(
        itemCategories,
        height: spacing(5),
      );
    }, [mixItems.length]);

    return BaseContentHeader(
      title: 'Danh sách âm thanh'.tr(),
      spacingSize: 4,
      child: Column(children: children),
    );
  }
}
