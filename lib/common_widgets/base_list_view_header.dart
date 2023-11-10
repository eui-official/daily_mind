import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseListViewHeader extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget trailing;

  const BaseListViewHeader({
    super.key,
    required this.title,
    required this.child,
    this.trailing = emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseSpacingContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing,
            ],
          ),
        ),
        child,
      ],
    );
  }
}
