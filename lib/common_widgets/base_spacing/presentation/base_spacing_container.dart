import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSpacingContainer extends StatelessWidget {
  final Alignment? alignment;
  final EdgeInsets? padding;
  final Widget child;

  const BaseSpacingContainer({
    super.key,
    required this.child,
    this.alignment,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding ?? EdgeInsets.all(spacing(2)),
      child: child,
    );
  }
}
