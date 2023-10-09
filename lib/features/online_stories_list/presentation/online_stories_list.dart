import 'package:daily_mind/common_widgets/base_list_stories_builder.dart';
import 'package:daily_mind/features/online_category/presentation/online_category.dart';
import 'package:flutter/material.dart';

class OnlineStoriesList extends StatelessWidget {
  const OnlineStoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListItems(
      onListItemBuilder: (context, listItemCategory) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listItemCategory.map(
            (itemCategory) {
              return OnlineCategory(itemCategory: itemCategory);
            },
          ).toList(),
        );
      },
    );
  }
}
