import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_widgets/base_linear_progress_indicator.dart';
import 'package:daily_mind/common_widgets/base_list_stories_builder/presentation/base_list_stories_builder_provider.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseListItems extends HookConsumerWidget {
  final OnListItemBuilder<ItemCategory> onListItemBuilder;

  const BaseListItems({
    super.key,
    required this.onListItemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseListStoriesBuilderState =
        ref.watch(baseListStoriesBuilderNotifierProvider);

    final child = useMemoized(() {
      final itemCategories = baseListStoriesBuilderState.value ?? [];

      if (baseListStoriesBuilderState.isLoading) {
        return const BaseLinearProgressIndicator();
      }

      return onListItemBuilder(
        context,
        itemCategories,
      );
    }, [baseListStoriesBuilderState]);

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: child,
    );
  }
}
