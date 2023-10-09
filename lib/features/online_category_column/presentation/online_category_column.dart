import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/features/online_card/presentation/online_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineCategoryColumn extends StatelessWidget {
  final Category category;
  final List<Item> fullItems;
  final List<Item> itemsChunked;

  const OnlineCategoryColumn({
    super.key,
    required this.category,
    required this.itemsChunked,
    required this.fullItems,
  }) : assert(itemsChunked.length <= 3);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: spacing(3)),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemsChunked.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing(2));
      },
      itemBuilder: (context, index) {
        final item = itemsChunked[index];

        return OnlineCard(
          category: category,
          fullItems: fullItems,
          item: item,
        );
      },
    );
  }
}
