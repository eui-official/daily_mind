import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseContentHeader extends StatelessWidget {
  final String title;
  final Widget child;

  const BaseContentHeader({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        child,
      ],
    );
  }
}
