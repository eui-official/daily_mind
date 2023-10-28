import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseCardContent extends StatelessWidget {
  final Widget child;

  const BaseCardContent({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: child,
    );
  }
}
