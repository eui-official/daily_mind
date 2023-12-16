import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseItemBoxSize extends StatelessWidget {
  final Widget child;

  const BaseItemBoxSize({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: spacing(6),
      child: child,
    );
  }
}
