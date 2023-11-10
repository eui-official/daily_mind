import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class FocusModeActions extends HookWidget {
  final FocusModeSessionSteps step;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onClose;
  final VoidCallback onSettings;
  final bool isPlaying;

  const FocusModeActions({
    super.key,
    required this.isPlaying,
    required this.onClose,
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
          icon: const Icon(Icons.settings),
          style: IconButton.styleFrom(
            backgroundColor: context.theme.cardColor,
          ),
        ),
        TogglePlayModeButton(
          backgroundColor: context.theme.primaryColorDark,
          isPlaying: isPlaying,
          onPause: onPause,
          onPlay: onPlay,
          padding: EdgeInsets.all(spacing(2)),
          size: 8,
        ),
        IconButton(
          onPressed: onClose,
          padding: EdgeInsets.all(spacing(2)),
          icon: const Icon(Icons.close),
          style: IconButton.styleFrom(
            backgroundColor: context.theme.cardColor,
          ),
        ),
      ],
    );
  }
}
