import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/features/story_card/presentation/story_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class StoriesCategoryColumn extends StatelessWidget {
  final List<Story> stories;

  const StoriesCategoryColumn({
    super.key,
    required this.stories,
  }) : assert(stories.length <= 3);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: spacing(3)),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stories.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing(2));
      },
      itemBuilder: (context, index) {
        final story = stories[index];

        return StoryCard(story: story);
      },
    );
  }
}
