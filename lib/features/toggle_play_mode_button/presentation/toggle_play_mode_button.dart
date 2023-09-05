import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TogglePlayModeButton extends HookWidget {
  final bool isPlaying;
  final VoidCallback onStop;
  final VoidCallback onPlay;
  final double? size;

  const TogglePlayModeButton({
    super.key,
    required this.isPlaying,
    required this.onStop,
    required this.onPlay,
    this.size,
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
          onPlay();
        }
      },
      [isPlaying, onPlay, onStop],
    );

    useEffect(() {
      if (isPlaying) {
        animationController.forward();
      } else {
        animationController.reverse();
      }

      return () {};
    }, [isPlaying]);

    return IconButton(
      onPressed: onToggle,
      icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: animationController,
        size: size,
      ),
    );
  }
}
