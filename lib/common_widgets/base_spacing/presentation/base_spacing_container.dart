import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSpacingContainer extends StatelessWidget {
  final Alignment? alignment;
  final BoxConstraints? constraints;
  final double size;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget child;

  const BaseSpacingContainer({
    super.key,
    this.alignment,
    this.padding,
    this.margin,
    this.size = 2,
    this.constraints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      constraints: constraints,
      margin: margin,
      padding: padding ?? EdgeInsets.all(spacing(size)),
      child: child,
    );
  }
}
