import 'package:collection/collection.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseSnackbarContent extends StatelessWidget {
  final String content;
  final Widget? trailing;
  final VoidCallback? onTap;

  const BaseSnackbarContent({
    super.key,
    required this.content,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              content,
              style: context.textTheme.bodyMedium,
            ),
            trailing,
          ].whereNotNull().toList(),
        ),
      ),
    );
  }
}
