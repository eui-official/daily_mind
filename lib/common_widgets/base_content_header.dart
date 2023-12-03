import 'package:collection/collection.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseContentHeader extends StatelessWidget {
  final String title;
  final Widget child;
  final double spacingSize;
  final Widget? trailing;

  const BaseContentHeader({
    super.key,
    required this.title,
    required this.child,
    this.trailing,
    this.spacingSize = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: space(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
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
