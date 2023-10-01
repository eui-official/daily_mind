import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/offline_list_chord_item/presentation/offline_list_chore_item_provider.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_provider.dart';
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
    final miniPlayerState = ref.read(miniPlayerProvider);
    final storyCardNotifier = ref.read(storyCardProvider.notifier);
    final offlineListChoreItemNotifier =
        ref.read(offlineListChoreItemProvider.notifier);
    final audioHandler = miniPlayerState.networkType == NetworkType.offline
        ? offlineListChoreItemNotifier.audioHandler
        : storyCardNotifier.audioHandler;

    final playBackState = useStream(audioHandler.playbackState);
    final isPlaying = playBackState.data?.playing ?? false;

    return TogglePlayModeButton(
      isPlaying: isPlaying,
      onPlay: storyCardNotifier.audioHandler.play,
      onPause: storyCardNotifier.audioHandler.pause,
      size: spacing(3),
    );
  }
}
