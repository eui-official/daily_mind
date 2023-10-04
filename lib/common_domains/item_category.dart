import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_category.freezed.dart';

@freezed
class ItemCategory with _$ItemCategory {
  const factory ItemCategory({
    required Category category,
    required List<Item> items,
  }) = _ItemCategory;
}
