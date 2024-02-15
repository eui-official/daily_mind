import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BaseGridItemsHeader<T> extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<T> items;
  final OnItemIndexBuilder<T> onItemIndexBuilder;

  const BaseGridItemsHeader({
    super.key,
    required this.items,
    required this.onItemIndexBuilder,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: BaseGridItems(
        items: items,
        crossAxisCount: 4,
        onItemIndexBuilder: (context, index, item) {
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1,
            child: onItemIndexBuilder(
              context,
              index,
              item,
            ),
          );
        },
      ),
    );
  }
}
