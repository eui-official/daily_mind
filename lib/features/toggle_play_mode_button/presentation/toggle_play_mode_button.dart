import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TogglePlayModeButton extends HookWidget {
  final GaplessAudioPlayer player;

  const TogglePlayModeButton({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    final playingSnapshot = useStream(player.playingStream);
    final animationController =
        useAnimationController(duration: defaultDuration);

    final isPlaying = playingSnapshot.data ?? false;

    final onToggle = useCallback(
      () {
        if (isPlaying) {
          animationController.forward();
          player.stop();
        } else {
          animationController.reverse();
          player.play();
        }
      },
      [isPlaying],
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
