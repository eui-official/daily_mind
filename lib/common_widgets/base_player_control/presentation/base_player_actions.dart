import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BasePlayerActions extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPause;
  final VoidCallback onPlay;

  const BasePlayerActions({
    super.key,
    required this.isPlaying,
    required this.onPause,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing(3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left_rounded),
            iconSize: spacing(5),
          ),
          TogglePlayModeButton(
            isPlaying: isPlaying,
            onPause: onPause,
            onPlay: onPlay,
            size: spacing(6),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right_rounded),
            iconSize: spacing(5),
          ),
        ],
      ),
    );
  }
}
