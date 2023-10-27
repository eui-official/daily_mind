import 'package:daily_mind/common_hooks/use_playlist_from_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/sound_images/presentation/sound_images_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineMiniPlayer extends HookConsumerWidget {
  const OfflineMiniPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseMiniPlayerState = ref.watch(baseMiniPlayerProvider);
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final playbackStateMemoized =
        useMemoized(() => baseAudioHandler.playbackState, []);

    final playBackState = useStream(playbackStateMemoized);
    final playlist = usePlaylistFromAudioHandler(ref);

    final items = playlist.items ?? [];
    final isPlaying = playBackState.data?.playing ?? false;
    final title = playlist.title ?? emptyString;

    if (items.isEmpty) {
      return emptyWidget;
    }

    return BaseMiniPlayer(
      onTap: baseMiniPlayerState.onTap,
      image: SoundImages(items: items, size: 5),
      isLoading: false,
      isPlaying: isPlaying,
      onPause: baseAudioHandler.pause,
      onPlay: baseAudioHandler.play,
      title: title.isEmpty ? appDescription : title,
    );
  }
}
