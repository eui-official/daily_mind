import 'package:flutter/material.dart';

class BaseInkWell extends StatelessWidget {
  final Color? color;
  final MaterialType type;
  final VoidCallback? onTap;
  final Widget? child;
  final BorderRadius? borderRadius;

  const BaseInkWell({
    super.key,
    this.borderRadius,
    this.child,
    this.color = Colors.transparent,
    this.onTap,
    this.type = MaterialType.transparency,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      type: type,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
