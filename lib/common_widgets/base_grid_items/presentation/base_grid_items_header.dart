import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class BaseGridItemsHeader<T> extends StatelessWidget {
  final List<T> items;
  final String title;
  final Widget headerTrailing;
  final OnItemIndexBuilder<T> onItemIndexBuilder;
  final EdgeInsetsGeometry? padding;

  const BaseGridItemsHeader({
    super.key,
    required this.items,
    required this.onItemIndexBuilder,
    this.headerTrailing = emptyWidget,
    this.padding,
    this.title = emptyString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            ListHeader(
              trailing: headerTrailing,
              child: Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          Flexible(
            child: BaseGridItems(
              items: items,
              onItemIndexBuilder: (context, index, item) {
                final index = items.indexOf(item);

                return onItemIndexBuilder(
                  context,
                  index,
                  item,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
