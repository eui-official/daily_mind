import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
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
            child: GridView.builder(
              padding: gridPadding,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 3,
                mainAxisSpacing: spacing(2),
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) => onSoundBuilder(
                context,
                index,
                items[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
