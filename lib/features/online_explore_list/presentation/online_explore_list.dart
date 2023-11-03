import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items_vertical.dart';
import 'package:daily_mind/common_widgets/base_list_items_builder/presentation/base_list_items_builder.dart';
import 'package:daily_mind/features/online_category/presentation/online_category.dart';
import 'package:flutter/material.dart';

class OnlineExploreList extends StatelessWidget {
  const OnlineExploreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListItemsBuilder(
      onListItemBuilder: (context, listItemCategory) {
        return BaseGridItemsVertical(
          items: listItemCategory,
          onItemBuilder: (context, index, itemCategory) {
            return OnlineCategory(itemCategory: itemCategory);
          },
        );
      },
    );
  }
}
