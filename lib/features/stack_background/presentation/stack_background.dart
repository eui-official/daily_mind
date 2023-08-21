import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class StackBackground extends StatelessWidget {
  final int backgroundIndex;
  final Widget child;

  const StackBackground({
    super.key,
    required this.child,
    this.backgroundIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(backgroundIndex: backgroundIndex),
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: spacing(4),
              horizontal: spacing(2),
            ),
            child: SafeArea(child: child),
          ),
        ),
      ],
    );
  }
}
