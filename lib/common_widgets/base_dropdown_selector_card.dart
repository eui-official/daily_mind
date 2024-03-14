import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseDropdownSelectorCard extends StatelessWidget {
  final Color? color;
  final BoxDecoration? decoration;
  final VoidCallback? onTap;
  final Widget child;

  const BaseDropdownSelectorCard({
    super.key,
    required this.child,
    this.color,
    this.decoration,
    this.onTap,
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
        child: child,
      ),
    );
  }
}
