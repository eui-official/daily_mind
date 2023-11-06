import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_widgets/base_list_items_builder/presentation/base_list_items_builder_provider.dart';
import 'package:daily_mind/common_widgets/base_list_items_builder/presentation/base_list_items_skeleton.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseListItemsBuilder extends HookConsumerWidget {
  final OnListItemBuilder<ItemCategory> onListItemBuilder;

  const BaseListItemsBuilder({
    super.key,
    required this.onListItemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseListItemsBuilderState =
        ref.watch(baseListItemsBuilderNotifierProvider);

    final child = useMemoized(() {
      final itemCategories = baseListItemsBuilderState.value ?? [];

      if (baseListItemsBuilderState.isLoading) {
        return const BaseListItemsSkeleton();
      }

      return onListItemBuilder(
        context,
        itemCategories,
      );
    }, [baseListItemsBuilderState]);

    return AnimatedSwitcher(
      duration: kThemeAnimationDuration,
      child: child,
    );
  }
}
