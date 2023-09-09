import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/disk_player/presentation/disk_player.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_adjust_bottom.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_provider.dart';
import 'package:daily_mind/features/play_mix_appbar/presentation/play_mix_appbar.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMix extends HookConsumerWidget {
  final int playlistId;

  const PlayMix({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlist = useMemoized(() => db.getPlaylistById(playlistId));
    final items = playlist?.items ?? [];

    final playMixNotifier = ref.read(playMixProvider.notifier);
    final playBackState = useStream(playMixNotifier.audioHandler.playbackState);
    final isPlaying = playBackState.data?.playing ?? false;

    useEffect(() {
      Future(() {
        playMixNotifier.audioHandler.initPlaylist(items);
      });

      return () {
        playMixNotifier.audioHandler.dispose();
      };
    }, [items]);

    return EmptyWidgetBuilder(
      data: playlist,
      builder: (safePlaylist) {
        final items = safePlaylist.items ?? [];
        final image = items.first.id.soundItem.image;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PlayMixAppBar(playlistId: safePlaylist.id),
          body: Stack(
            children: [
              StackBackground(
                image: image,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DiskPlayer(
                      image: image,
                      isPlaying: isPlaying,
                    ),
                  ],
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.25,
                maxChildSize: 0.75,
                builder: (
                  BuildContext context,
                  ScrollController scrollController,
                ) {
                  return PlayMixAdjustBottom(
                    items: items,
                    playlistId: safePlaylist.id,
                    scrollController: scrollController,
                    initialTitle: safePlaylist.title,
                    onChanged: (newName) => db.onUpdatePlaylistTitle(
                      safePlaylist.id,
                      newName,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
