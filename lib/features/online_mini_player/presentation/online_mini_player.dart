import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_skeleton.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/features/online_player/presentation/online_player.dart';
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
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final onlinePlayer = baseBackgroundHandler.onlinePlayer;

    final currentIndexSnapshot = useStream(onlinePlayer.currentIndexStream);
    final currentIndex = currentIndexSnapshot.data ?? 0;

    final processingStateSnapshot =
        useStream(onlinePlayer.processingStateStream);
    final playBackState = useStream(baseBackgroundHandler.playbackState);
    final isLoading = processingStateSnapshot.data == ProcessingState.loading;
    final isPlaying = playBackState.data?.playing ?? false;

    final sequence = onlinePlayer.audioSource?.sequence ?? [];

    final onOpenPlayerOnline = useCallback(() {
      onShowScrollableBottomSheet(
        context,
        useSafeArea: false,
        initialChildSize: 1,
        builder: (context, scrollController) => OnlinePlayer(
          scrollController: scrollController,
        ),
      );
    }, [context]);

    final child = useMemoized(() {
      if (onlinePlayer.isReady) {
        final item = sequence[currentIndex];
        final audio = item.tag as Audio;

        return BaseMiniPlayer(
          onTap: onOpenPlayerOnline,
          leading: BaseNetworkImage(
            image: audio.image,
            size: 5,
          ),
          isLoading: isLoading,
          isPlaying: isPlaying,
          onPause: baseBackgroundHandler.pause,
          onPlay: baseBackgroundHandler.play,
          title: audio.name,
        );
      }

      return const BaseMiniPlayerSkeleton();
    }, [
      currentIndex,
      isLoading,
      isPlaying,
      onlinePlayer.isReady,
      sequence,
    ]);

    return BaseAnimatedSwitcher(child: child);
  }
}
