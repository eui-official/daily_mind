import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BaseGridItemsVertical<T> extends StatelessWidget {
  final List<T> items;
  final OnItemBuilder<T> onItemBuilder;

  const BaseGridItemsVertical({
    super.key,
    required this.items,
    required this.onItemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 1,
      mainAxisSpacing: spacing(2),
      crossAxisSpacing: spacing(2),
      children: items.map((item) {
        final index = items.indexOf(item);

        return onItemBuilder(
          context,
          index,
          item,
        );
      }).toList(),
    );
  }
}
