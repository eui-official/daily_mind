import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BaseGridItems<T> extends StatelessWidget {
  final int crossAxisCount;
  final List<T> items;
  final OnItemIndexBuilder<T> onItemIndexBuilder;

  const BaseGridItems({
    super.key,
    this.crossAxisCount = 1,
    required this.items,
    required this.onItemIndexBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: spacing(2),
      crossAxisSpacing: spacing(2),
      children: items.map((item) {
        final index = items.indexOf(item);

        return onItemIndexBuilder(
          context,
          index,
          item,
        );
      }).toList(),
    );
  }
}
