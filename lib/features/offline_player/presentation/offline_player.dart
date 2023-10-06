import 'package:daily_mind/common_widgets/base_player_details.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_bottom.dart';
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

    return EmptyWidgetBuilder(
      data: playlist,
      builder: (safePlaylist) {
        final items = safePlaylist.items ?? [];
        final image = items.first.id.soundOfflineItem.image;

        return DraggableScrollableSheet(
          initialChildSize: 1,
          builder: (context, scrollController) {
            return BasePlayerDetails(
              image: AssetImage(image),
              scrollController: scrollController,
              child: OfflinePlayerBottom(
                items: items,
                playlistId: safePlaylist.id,
                initialTitle: safePlaylist.title,
                onChanged: (newName) => db.onUpdatePlaylistTitle(
                  safePlaylist.id,
                  newName,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
