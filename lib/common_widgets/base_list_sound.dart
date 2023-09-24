import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/sound_card.dart';
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

  const BaseListSound({
    super.key,
    required this.items,
    required this.title,
    required this.onSoundBuilder,
    this.headerTrailing = emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
          child: Container(
            height: itemHeight,
            padding: EdgeInsets.only(top: spacing()),
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: spacing()),
              itemBuilder: (context, index) => onSoundBuilder(
                context,
                index,
                items[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
