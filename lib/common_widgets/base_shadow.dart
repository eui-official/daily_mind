import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseShadow extends StatelessWidget {
  final Widget child;
  final Color? color;
  final BorderRadius borderRadius;

  const BaseShadow({
    super.key,
    required this.child,
    this.borderRadius = BorderRadius.zero,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: spacing(2),
      margin: EdgeInsets.zero,
      shadowColor: Colors.black87,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: child,
    );
  }
}
