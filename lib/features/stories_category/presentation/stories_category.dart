import 'package:card_swiper/card_swiper.dart';
import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/story_category.dart';
import 'package:daily_mind/features/stories_category_column/presentation/stories_category_column.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class StoriesCategory extends StatelessWidget {
  final StoryCategory storyCategory;

  const StoriesCategory({
    super.key,
    required this.storyCategory,
  });

  @override
  Widget build(BuildContext context) {
    final storiesGroup = storyCategory.stories.slices(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: spacing(2),
            left: spacing(2),
          ),
          child: Text(
            storyCategory.category.name,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: spacing(30),
          child: Swiper(
            viewportFraction: 0.9,
            itemBuilder: (context, index) {
              final stories = storiesGroup[index];

              return Container(
                transform:
                    Transform.translate(offset: Offset(-spacing(2.75), 0))
                        .transform,
                child: StoriesCategoryColumn(
                  category: storyCategory.category,
                  stories: stories,
                ),
              );
            },
            itemCount: storiesGroup.length,
            loop: false,
          ),
        ),
      ],
    );
  }
}
