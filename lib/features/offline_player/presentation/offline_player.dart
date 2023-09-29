import 'package:daily_mind/common_widgets/base_player_control.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_adjust_bottom.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_provider.dart';
import 'package:daily_mind/features/offline_player_appbar/presentation/offline_player_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflinePlayer extends HookConsumerWidget {
  final int playlistId;

  const OfflinePlayer({
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
        playMixNotifier.audioHandler.onInitPlaylist(items);
      });

      return () {
        playMixNotifier.audioHandler.onDispose();
      };
    }, [items]);

    return EmptyWidgetBuilder(
      data: playlist,
      builder: (safePlaylist) {
        final items = safePlaylist.items ?? [];
        final image = items.first.id.soundOfflineItem.image;

        return BasePlayerControl(
          preferredSizeWidget: OfflinePlayerAppBar(playlistId: safePlaylist.id),
          image: image,
          isPlaying: isPlaying,
          bottomChildBuilder: (context, scrollController) {
            return OfflinePlayerAdjustBottom(
              items: items,
              scrollController: scrollController,
              playlistId: safePlaylist.id,
              initialTitle: safePlaylist.title,
              onChanged: (newName) => db.onUpdatePlaylistTitle(
                safePlaylist.id,
                newName,
              ),
            );
          },
        );
      },
    );
  }
}
