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
  final bool isPlaying;

  const FocusModeActions({
    super.key,
    required this.isPlaying,
    required this.onPause,
    required this.onPlay,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TogglePlayModeButton(
          backgroundColor: context.theme.primaryColorDark,
          isPlaying: isPlaying,
          onPause: onPause,
          onPlay: onPlay,
          padding: EdgeInsets.all(spacing(2)),
          size: 8,
        ),
      ],
    );
  }
}
