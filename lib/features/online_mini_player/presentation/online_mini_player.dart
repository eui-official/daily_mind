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
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final onlinePlayer = baseBackgroundHandler.onlinePlayer;

    final currentIndexStreamMemoized =
        useMemoized(() => onlinePlayer.currentIndexStream, []);

    final currentIndexSnapshot = useStream(currentIndexStreamMemoized);

    final processingStateStreamMemoized = useMemoized(
      () => onlinePlayer.processingStateStream,
      [],
    );

    final processingStateSnapshot = useStream(processingStateStreamMemoized);

    final playbackStateMemoized = useMemoized(
      () => baseBackgroundHandler.playbackState,
      [],
    );

    final playBackState = useStream(playbackStateMemoized);

    final sequence = onlinePlayer.audioSource?.sequence ?? [];
    final currentIndex = currentIndexSnapshot.data ?? 0;

    final isLoading = processingStateSnapshot.data != ProcessingState.ready;
    final isPlaying = playBackState.data?.playing ?? false;

    if (sequence.isNotEmpty) {
      final item = sequence[currentIndex];
      final tag = item.tag;

      return BaseMiniPlayer(
        onTap: baseMiniPlayerState.onTap,
        leading: BaseNetworkImage(
          image: tag.image,
          size: 5,
        ),
        isLoading: isLoading,
        isPlaying: isPlaying,
        onPause: baseBackgroundHandler.pause,
        onPlay: baseBackgroundHandler.play,
        title: tag.name,
      );
    }

    return emptyWidget;
  }
}
