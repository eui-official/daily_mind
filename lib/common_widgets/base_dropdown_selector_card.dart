import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseDropdownSelectorCard extends StatelessWidget {
  final BoxDecoration? decoration;
  final Color? color;
  final VoidCallback? onTap;
  final Widget child;
  final Widget? icon;
  final Widget? trailing;

  const BaseDropdownSelectorCard({
    super.key,
    required this.child,
    this.color,
    this.decoration,
    this.icon,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInkWell(
      color: color,
      onTap: onTap,
      borderRadius: circularRadius(2),
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        decoration: decoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            child,
            Row(
              children: space(
                [
                  trailing,
                  icon ?? const Icon(Icons.keyboard_arrow_down_rounded),
                ].whereNotNull().toList(),
                width: spacing(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
