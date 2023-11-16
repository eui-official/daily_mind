import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseIconButtonWithTitle extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final String title;
  final ButtonStyle? style;

  const BaseIconButtonWithTitle({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: icon,
          style: style,
        ),
        Text(
          title,
          style: context.textTheme.bodySmall?.copyWith(
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
