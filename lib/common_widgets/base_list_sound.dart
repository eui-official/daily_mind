import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/utils.dart' hide Trans;

class BaseListSound<T> extends StatelessWidget {
  final List<T> items;
  final String title;
  final Widget headerTrailing;
  final OnSoundBuilder<T> onSoundBuilder;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? gridPadding;

  const BaseListSound({
    super.key,
    required this.items,
    required this.onSoundBuilder,
    this.title = emptyString,
    this.gridPadding,
    this.headerTrailing = emptyWidget,
    this.padding,
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
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: spacing(2),
              crossAxisSpacing: spacing(2),
              children: items.map((item) {
                final index = items.indexOf(item);

                return onSoundBuilder(
                  context,
                  index,
                  item,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
