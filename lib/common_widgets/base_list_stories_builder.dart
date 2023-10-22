import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_linear_progress_indicator.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class BaseListItems extends HookConsumerWidget {
  final OnListItemBuilder<ItemCategory> onListItemBuilder;

  const BaseListItems({
    super.key,
    required this.onListItemBuilder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsQuery = useMemoized(() => supabase.from('items').select(), []);
    final itemsSnapshot = useFuture(itemsQuery);
    final configState = ref.watch(configProvider);
    final Widget child;

    if (itemsSnapshot.hasData) {
      List<Item> listItem = [];
      final list = itemsSnapshot.data as List<dynamic>;

      for (final story in list) {
        listItem.add(Item.fromJson(story));
      }

      final groupItems = listItem.groupListsBy((element) => element.category);

      List<ItemCategory> listItemCategory = [];

      groupItems.forEach((categoryId, items) {
        final category = configState.categories
            .firstWhere((category) => category.id == categoryId);

        items.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        listItemCategory.add(
          ItemCategory(
            category: category,
            items: items,
          ),
        );
      });

      child = onListItemBuilder(
        context,
        listItemCategory,
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
