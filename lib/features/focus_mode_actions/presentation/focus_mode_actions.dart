import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class FocusModeActions extends HookWidget {
  final FocusModeSessionSteps step;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onEdit;
  final VoidCallback onSettings;
  final bool isRunning;

  const FocusModeActions({
    super.key,
    required this.isRunning,
    required this.onEdit,
    required this.onPause,
    required this.onPlay,
    required this.onSettings,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: onSettings,
          padding: EdgeInsets.all(spacing(2)),
          icon: const Icon(Icons.restart_alt_rounded),
          style: IconButton.styleFrom(
            backgroundColor: context.theme.cardColor,
          ),
        ),
        TogglePlayModeButton(
          backgroundColor: context.theme.primaryColorDark,
          isPlaying: isRunning,
          onPause: onPause,
          onPlay: onPlay,
          padding: EdgeInsets.all(spacing(2)),
          size: 5,
        ),
        IconButton(
          onPressed: onEdit,
          padding: EdgeInsets.all(spacing(2)),
          icon: const Icon(Icons.edit),
          style: IconButton.styleFrom(
            backgroundColor: context.theme.cardColor,
          ),
        ),
      ],
    );
  }
}
