import 'package:daily_mind/features/offline_player/presentation/offline_player_provider.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflinePlayerToggleButton extends HookConsumerWidget {
  const OfflinePlayerToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playMixNotifier = ref.read(playMixProvider.notifier);

    final playbackStateMemoized =
        useMemoized(() => playMixNotifier.audioHandler.playbackState, []);

    final playBackState = useStream(playbackStateMemoized);

    final isPlaying = playBackState.data?.playing ?? false;

    return RepaintBoundary(
      child: TogglePlayModeButton(
        isPlaying: isPlaying,
        onPlay: playMixNotifier.audioHandler.play,
        onPause: playMixNotifier.audioHandler.pause,
        size: 40,
      ),
    );
  }
}
