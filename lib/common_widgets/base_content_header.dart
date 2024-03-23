import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:collection/collection.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseContentHeader extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final double spacingSize;
  final MainAxisAlignment rowMainAxisAlignment;
  final String title;
  final TextStyle? titleStyle;
  final Widget child;
  final Widget? trailing;

  const BaseContentHeader({
    super.key,
    required this.child,
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.rowMainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.spacingSize = 2,
    this.titleStyle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: space(
        [
          Row(
            mainAxisAlignment: rowMainAxisAlignment,
            children: [
              Text(
                title,
                style: titleStyle ??
                    context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              trailing,
            ].whereNotNull().toList(),
          ),
          child
        ],
        height: spacing(spacingSize),
      ),
    );
  }
}
