import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseSpacingContainer extends StatelessWidget {
  final Alignment? alignment;
  final double size;
  final EdgeInsets? padding;
  final Widget child;

  const BaseSpacingContainer({
    super.key,
    this.alignment,
    this.padding,
    this.size = 2,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: EdgeInsets.all(spacing(size)),
      child: child,
    );
  }
}
