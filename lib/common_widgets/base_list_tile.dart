import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseListTile extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Color? color;
  final String title;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;

  const BaseListTile({
    super.key,
    required this.title,
    this.borderRadius,
    this.color,
    this.leading,
    this.onTap,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? circularRadius(2),
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          leading: leading,
          onTap: onTap,
          subtitle: subtitle,
          title: Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}
