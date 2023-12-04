import 'package:collection/collection.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseContentHeader extends StatelessWidget {
  final double spacingSize;
  final String title;
  final TextStyle? titleStyle;
  final Widget child;
  final Widget? trailing;

  const BaseContentHeader({
    super.key,
    required this.child,
    required this.title,
    this.spacingSize = 2,
    this.titleStyle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: space(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: titleStyle ??
                    Theme.of(context).textTheme.titleMedium?.copyWith(
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
