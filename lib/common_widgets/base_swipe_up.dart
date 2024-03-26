import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseSwipeUp extends HookWidget {
  final double sensitivity;
  final VoidCallback onSwipeUp;
  final Widget child;

  const BaseSwipeUp({
    super.key,
    required this.onSwipeUp,
    required this.child,
    this.sensitivity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    final initialOffset = useState(0.0);
    final swipeOffset = useState(0.0);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: (details) {
        initialOffset.value = details.globalPosition.dy;
      },
      onVerticalDragUpdate: (details) {
        if (details.globalPosition.dy - initialOffset.value < 0.0) {
          swipeOffset.value =
              -(details.globalPosition.dy - initialOffset.value) * sensitivity;
        }
      },
      onVerticalDragEnd: (details) {
        if (swipeOffset.value > context.height / 8) {
          onSwipeUp();
        }
        swipeOffset.value = 0.0;
      },
      child: child,
    );
  }
}
