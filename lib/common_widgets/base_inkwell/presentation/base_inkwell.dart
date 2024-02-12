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
    this.color = Colors.transparent,
    this.type = MaterialType.button,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        color: color,
        type: type,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
