import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';

class BaseBackdropFilterOverlay extends StatelessWidget {
  final LinearGradient? gradient;

  const BaseBackdropFilterOverlay({
    super.key,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? context.baseLinearGradient,
      ),
    );
  }
}
