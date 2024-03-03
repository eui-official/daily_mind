import 'package:daily_mind/common_widgets/base_sliable.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/extensions/theme.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class BaseTile extends HookWidget {
  final BorderRadius? borderRadius;
  final Color? color;
  final String title;
  final VoidCallback? onTap;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;

  const BaseTile({
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
    final ancestor = context.findAncestorWidgetOfExactType<BaseSliable>();

    final clipBorderRadius = useMemoized(() {
      if (ancestor == kNull) {
        return circularRadius(2);
      }

      return BorderRadius.only(
        topLeft: Radius.circular(spacing(2)),
        bottomLeft: Radius.circular(spacing(2)),
      );
    }, [ancestor]);

    return ClipRRect(
      borderRadius: borderRadius ?? clipBorderRadius,
      child: Material(
        color: context.theme.menuBackground,
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
