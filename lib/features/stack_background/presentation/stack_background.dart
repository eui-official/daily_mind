import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:flutter/material.dart';

class StackBackground extends StatelessWidget {
  final ImageProvider image;
  final Widget child;

  const StackBackground({
    super.key,
    required this.child,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(image: image),
        child,
      ],
    );
  }
}
