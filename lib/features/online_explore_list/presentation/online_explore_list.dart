import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items.dart';
import 'package:daily_mind/common_widgets/base_list_items_builder/presentation/base_list_items_builder.dart';
import 'package:daily_mind/features/online_category/presentation/online_category.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal.dart';
import 'package:flutter/material.dart';

class OnlineExploreList extends StatelessWidget {
  const OnlineExploreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListItemsBuilder(
      onListItemBuilder: (context, listItemCategory) {
        return BaseGridItems(
          items: listItemCategory,
          onItemBuilder: (context, index, itemCategory) {
            if (itemCategory.category.layout == 'vertical') {
              return OnlineCategory(itemCategory: itemCategory);
            }

            return OnlineCategoryHorizontal(itemCategory: itemCategory);
          },
        );
      },
    );
  }
}
