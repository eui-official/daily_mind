import 'package:daily_mind/common_domains/story_category.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storyCategory.category.name,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
