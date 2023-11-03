import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseListViewHeader extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseListViewHeader({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSpacingContainer(
          child: Text(
            title,
            style: context.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        child
      ],
    );
  }
}
