import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TogglePlayModeButton extends HookWidget {
  final bool isPlaying;
  final Color backgroundColor;
  final double size;
  final EdgeInsets? padding;
  final VoidCallback onPause;
  final VoidCallback onPlay;

  const TogglePlayModeButton({
    super.key,
    required this.isPlaying,
    required this.onPause,
    required this.onPlay,
    this.backgroundColor = Colors.transparent,
    this.padding,
    this.size = 5,
  });

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: shortDuration);

    final onToggle = useCallback(
      () {
        if (isPlaying) {
          animationController.forward();
          onPause();
        } else {
          animationController.reverse();
          onPlay();
        }
      },
      [isPlaying, onPlay, onPause],
    );

    useEffect(() {
      Future.delayed(shortDuration, () {
        if (isPlaying) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
      });

      return () {};
    }, [isPlaying]);

    return Material(
      borderRadius: circularRadius(size),
      color: backgroundColor,
      child: InkWell(
        borderRadius: circularRadius(size),
        onTap: onToggle,
        child: Container(
          padding: padding ?? EdgeInsets.all(spacing()),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: animationController,
            size: spacing(size),
          ),
        ),
      ),
    );
  }
}
