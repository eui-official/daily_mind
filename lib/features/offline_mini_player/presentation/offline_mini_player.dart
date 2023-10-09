import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/sound_images_stack/presentation/sound_images_stack.dart';
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

    final baseAudioHandlerNotifier =
        ref.read(baseAudioHandlerProvider.notifier);
    final audioHandler = baseAudioHandlerNotifier.audioHandler;

    final currentPlaylistSnapshot =
        useStream(audioHandler.streamCurrentPlaylist.stream);
    final playBackState = useStream(audioHandler.playbackState);

    final currentPlaylist = currentPlaylistSnapshot.data ?? Playlist();

    final playlistSnapshot =
        useStream(db.streamPlaylistById(currentPlaylist.id));
    final playlist = playlistSnapshot.data ?? Playlist();

    final items = playlist.items ?? [];
    final isPlaying = playBackState.data?.playing ?? false;
    final title = playlist.title ?? emptyString;

    if (items.isEmpty) {
      return emptyWidget;
    }

    return BaseMiniPlayer(
      onTap: baseMiniPlayerState.onTap,
      image: SoundImagesStack(
        items: items,
        size: 6,
      ),
      isLoading: false,
      isPlaying: isPlaying,
      onPause: audioHandler.pause,
      onPlay: audioHandler.play,
      title: title.isEmpty ? appDescription : title,
    );
  }
}
