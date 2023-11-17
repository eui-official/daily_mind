import 'dart:ui';

import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseBackdropFilter extends StatelessWidget {
  final BorderRadius borderRadius;
  final Widget? child;

  const BaseBackdropFilter({
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: spacing(),
          sigmaY: spacing(),
        ),
        child: child ?? Container(),
      ),
    );
  }
}
