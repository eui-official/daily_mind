import 'package:daily_mind/common_widgets/base_list_stories_builder.dart';
import 'package:daily_mind/features/online_category/presentation/online_category.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OnlineStoriesList extends StatelessWidget {
  const OnlineStoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListItems(
      onListItemBuilder: (context, listItemCategory) {
        return StaggeredGrid.count(
          crossAxisCount: 1,
          mainAxisSpacing: spacing(2),
          crossAxisSpacing: spacing(2),
          children: listItemCategory.map((itemCategory) {
            return OnlineCategory(itemCategory: itemCategory);
          }).toList(),
        );
      },
    );
  }
}
