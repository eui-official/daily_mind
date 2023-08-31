import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TogglePlayModeButton extends HookWidget {
  final bool isPlaying;
  final VoidCallback onStop;
  final VoidCallback onStart;

  const TogglePlayModeButton({
    super.key,
    required this.isPlaying,
    required this.onStop,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final animationController =
        useAnimationController(duration: defaultDuration);

    final onToggle = useCallback(
      () {
        if (isPlaying) {
          animationController.forward();
          onStop();
        } else {
          animationController.reverse();
          onStart();
        }
      },
      [isPlaying, onStart, onStop],
    );

    return IconButton(
      onPressed: onToggle,
      icon: AnimatedIcon(
        icon: AnimatedIcons.pause_play,
        progress: animationController,
      ),
    );
  }
}
