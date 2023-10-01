import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MiniPlayerToggleButton extends HookConsumerWidget {
  const MiniPlayerToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandlerNotifier =
        ref.read(baseAudioHandlerProvider.notifier);
    final audioHandler = baseAudioHandlerNotifier.audioHandler;

    final playBackState = useStream(audioHandler.playbackState);
    final isPlaying = playBackState.data?.playing ?? false;

    return TogglePlayModeButton(
      isPlaying: isPlaying,
      onPlay: audioHandler.play,
      onPause: audioHandler.pause,
      size: spacing(3),
    );
  }
}
