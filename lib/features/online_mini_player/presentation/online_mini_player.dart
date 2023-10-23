import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
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
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final onlinePlayer = baseAudioHandler.onlinePlayer;

    final currentIndexSnapshot = useStream(onlinePlayer.currentIndexStream);
    final processingStateSnapshot =
        useStream(onlinePlayer.processingStateStream);
    final playBackState = useStream(baseAudioHandler.playbackState);

    final sequence = onlinePlayer.audioSource?.sequence ?? [];
    final currentIndex = currentIndexSnapshot.data ?? 0;

    final isLoading = processingStateSnapshot.data != ProcessingState.ready;
    final isPlaying = playBackState.data?.playing ?? false;

    if (sequence.isNotEmpty) {
      final item = sequence[currentIndex];
      final tag = item.tag;

      return BaseMiniPlayer(
        onTap: baseMiniPlayerState.onTap,
        image: BaseNetworkImage(
          image: tag.image,
          size: 5,
        ),
        isLoading: isLoading,
        isPlaying: isPlaying,
        onPause: baseAudioHandler.pause,
        onPlay: baseAudioHandler.play,
        title: tag.name,
      );
    }

    return emptyWidget;
  }
}
