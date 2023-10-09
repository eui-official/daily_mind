import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_loading_indicator.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseMiniPlayerToggleButton extends HookWidget {
  final bool isLoading;
  final bool isPlaying;
  final VoidCallback onPlay;
  final VoidCallback onPause;

  const BaseMiniPlayerToggleButton({
    super.key,
    this.isLoading = false,
    required this.isPlaying,
    required this.onPlay,
    required this.onPause,
  });

  @override
  Widget build(BuildContext context) {
    final child = useMemoized(() {
      if (isLoading) {
        return const BaseMiniPlayerLoadingIndicator();
      }

      return TogglePlayModeButton(
        isPlaying: isPlaying,
        onPlay: onPlay,
        onPause: onPause,
        size: spacing(3),
      );
    }, [isLoading, isPlaying]);

    return AnimatedSwitcher(
      duration: kThemeChangeDuration,
      child: child,
    );
  }
}
