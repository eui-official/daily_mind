import 'package:flutter/material.dart';

class BaseInkWell extends StatelessWidget {
  final BorderRadius borderRadius;
  final MaterialType type;
  final Color? color;
  final VoidCallback? onTap;
  final Widget? child;

  const BaseInkWell({
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.child,
    this.color,
    this.onTap,
    this.type = MaterialType.button,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: color ?? Colors.transparent,
        type: type,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
