import 'package:daily_mind/features/play_mix/presentation/play_mix_provider.dart';
import 'package:daily_mind/features/toggle_play_mode_button/presentation/toggle_play_mode_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixToggleButton extends HookConsumerWidget {
  const PlayMixToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playMixState = ref.watch(playMixProvider);
    final playMixNotifier = ref.read(playMixProvider.notifier);

    return TogglePlayModeButton(
      isPlaying: playMixState.isPlaying,
      onPlay: playMixNotifier.play,
      onStop: playMixNotifier.stop,
      size: 40,
    );
  }
}
