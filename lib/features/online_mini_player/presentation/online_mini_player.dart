import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/features/online_card/presentation/online_card_image.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class OnlineMiniPlayer extends HookConsumerWidget {
  const OnlineMiniPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseMiniPlayerState = ref.watch(baseMiniPlayerProvider);

    final baseAudioHandlerNotifier =
        ref.read(baseAudioHandlerProvider.notifier);
    final audioHandler = baseAudioHandlerNotifier.audioHandler;
    final onlinePlayer = audioHandler.onlinePlayer;

    final currentIndexSnapshot =
        useStream(onlinePlayer.player.currentIndexStream);
    final processingStateSnapshot =
        useStream(onlinePlayer.player.processingStateStream);
    final playBackState = useStream(audioHandler.playbackState);

    final sequence = onlinePlayer.player.audioSource?.sequence ?? [];
    final currentIndex = currentIndexSnapshot.data ?? 0;

    final isLoading = processingStateSnapshot.data != ProcessingState.ready;
    final isPlaying = playBackState.data?.playing ?? false;

    if (sequence.isNotEmpty) {
      final item = sequence[currentIndex];
      final tag = item.tag;

      return BaseMiniPlayer(
        onTap: baseMiniPlayerState.onTap,
        image: OnlineCardImage(image: tag.image),
        isLoading: isLoading,
        isPlaying: isPlaying,
        onPause: audioHandler.pause,
        onPlay: audioHandler.play,
        title: tag.name,
      );
    }

    return emptyWidget;
  }
}
