import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class BaseListTile extends StatelessWidget {
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final Widget title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;

  const BaseListTile({
    super.key,
    required this.title,
    this.borderRadius,
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
          title: title,
          trailing: trailing,
        ),
      ),
    );
  }
}
