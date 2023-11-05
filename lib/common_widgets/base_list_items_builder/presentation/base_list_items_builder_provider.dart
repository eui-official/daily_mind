import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/supabase.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'base_list_items_builder_provider.g.dart';

@riverpod
class BaseListItemsBuilderNotifier extends _$BaseListItemsBuilderNotifier {
  @override
  Future<List<ItemCategory>> build() => onGetItemCategory();

  Future<void> onRefreshItemsCategory() async {
    final configNotifier = ref.read(configProvider.notifier);
    await configNotifier.onInit();
    final itemCategories = await onGetItemCategory();

    update((state) => itemCategories);
  }

  Future<List<ItemCategory>> onGetItemCategory() async {
    final configState = ref.read(configProvider);

    final items = await supabase.from('items').select().order('created_at');

    List<Item> listItem = [];

    for (final item in items) {
      listItem.add(Item.fromJson(item));
    }

    final groupItems = listItem.groupListsBy((element) => element.category);

    List<ItemCategory> listItemCategory = [];

    groupItems.forEach((categoryId, items) {
      final category = configState.categories
          .firstWhere((category) => category.id == categoryId);

      listItemCategory.add(
        ItemCategory(
          category: category,
          items: items,
        ),
      );
    });

    return listItemCategory;
  }
}
