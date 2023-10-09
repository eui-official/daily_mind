import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasePlayerActions extends HookWidget {
  final bool isPlaying;
  final VoidCallback onPause;
  final VoidCallback onPlay;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const BasePlayerActions({
    super.key,
    required this.isPlaying,
    required this.onPause,
    required this.onPlay,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    final onPreviousChild = useMemoized(
      () {
        if (onPrevious is VoidCallback) {
          return IconButton(
            onPressed: onPrevious,
            icon: const Icon(Icons.chevron_left_rounded),
            iconSize: spacing(5),
          );
        }

        return emptyWidget;
      },
      [onPrevious],
    );

    final onNextChild = useMemoized(
      () {
        if (onNext is VoidCallback) {
          return IconButton(
            onPressed: onNext,
            icon: const Icon(Icons.chevron_right_rounded),
            iconSize: spacing(5),
          );
        }

        return emptyWidget;
      },
      [onNext],
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing(3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          onPreviousChild,
          TogglePlayModeButton(
            isPlaying: isPlaying,
            onPause: onPause,
            onPlay: onPlay,
            size: spacing(6),
          ),
          onNextChild,
        ],
      ),
    );
  }
}
