import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

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
      child: Container(child: child).frosted(
        frostColor: context.theme.colorScheme.background,
      ),
    );
  }
}
