import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseContentHeader extends StatelessWidget {
  final String title;
  final Widget child;
  final double spacingSize;

  const BaseContentHeader({
    super.key,
    required this.title,
    required this.child,
    this.spacingSize = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: space(
        [
          Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          child
        ],
        height: spacing(spacingSize),
      ),
    );
  }
}
