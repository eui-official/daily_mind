import 'package:daily_mind/common_widgets/base_list_stories_builder.dart';
import 'package:daily_mind/features/stories_category/presentation/stories_category.dart';
import 'package:flutter/material.dart';

class StoriesList extends StatelessWidget {
  const StoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListStories(
      onListItemBuilder: (context, listStoryCategory) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listStoryCategory.map(
            (storyCategory) {
              return StoriesCategory(storyCategory: storyCategory);
            },
          ).toList(),
        );
      },
    );
  }
}
