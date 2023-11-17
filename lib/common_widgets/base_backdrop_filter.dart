import 'package:daily_mind/theme/common.dart';
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
    return Container(
      decoration: const BoxDecoration(gradient: baseLinearGradient),
    );
  }
}
