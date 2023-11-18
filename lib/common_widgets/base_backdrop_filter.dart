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
      child: Stack(
        children: [
          child ?? Container(),
          Container().frosted(
            frostOpacity: 0.2,
            frostColor: context.theme.colorScheme.background,
          ),
        ],
      ),
    );
  }
}
