import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/common_domains/story_category.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class BaseListStories extends HookConsumerWidget {
  final OnListItemBuilder<StoryCategory> onListItemBuilder;

  const BaseListStories({
    super.key,
    required this.onListItemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configProvider);

    return FutureBuilder(
      future: supabase.from('stories').select(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Story> listStory = [];
          final list = snapshot.data as List<dynamic>;

          for (final story in list) {
            listStory.add(Story.fromJson(story));
          }

          final groupStories =
              listStory.groupListsBy((element) => element.category);

          List<StoryCategory> listStoryCategory = [];

          groupStories.forEach((categoryId, stories) {
            final category = configState.categories
                .firstWhere((category) => category.id == categoryId);

            listStoryCategory.add(
              StoryCategory(
                category: category,
                stories: stories,
              ),
            );
          });

          return onListItemBuilder(
            context,
            listStoryCategory,
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
