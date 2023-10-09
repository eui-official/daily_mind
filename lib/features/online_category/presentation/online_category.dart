import 'package:card_swiper/card_swiper.dart';
import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/features/online_category_column/presentation/online_category_column.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnlineCategory extends StatelessWidget {
  final ItemCategory itemCategory;

  const OnlineCategory({
    super.key,
    required this.itemCategory,
  });

  @override
  Widget build(BuildContext context) {
    final itemsGroup = itemCategory.items.slices(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: spacing(3.5),
            left: spacing(2),
          ),
          child: Text(
            itemCategory.category.name,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: spacing(30),
          child: Swiper(
            viewportFraction: 0.9,
            itemBuilder: (context, index) {
              final itemsChunked = itemsGroup[index];

              return Container(
                transform:
                    Transform.translate(offset: Offset(-spacing(2.75), 0))
                        .transform,
                child: OnlineCategoryColumn(
                  category: itemCategory.category,
                  fullItems: itemCategory.items,
                  itemsChunked: itemsChunked,
                ),
              );
            },
            itemCount: itemsGroup.length,
            loop: false,
          ),
        ),
      ],
    );
  }
}
