import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/common_domains/story_category.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_linear_progress_indicator.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final storiesQuery =
        useMemoized(() => supabase.from('stories').select(), []);
    final storiesSnapshot = useFuture(storiesQuery);
    final configState = ref.watch(configProvider);
    final Widget child;

    if (storiesSnapshot.hasData) {
      List<Story> listStory = [];
      final list = storiesSnapshot.data as List<dynamic>;

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

      child = onListItemBuilder(
        context,
        listStoryCategory,
      );
    } else {
      child = const BaseLinearProgressIndicator();
    }

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: child,
    );
  }
}
