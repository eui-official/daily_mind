import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflinePlayerAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  final int playlistId;

  const OfflinePlayerAppBar({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamPlaylist = useMemoized(() => db.streamPlaylistById(playlistId));
    final snapshotPlaylist = useStream(streamPlaylist);
    final playlist = snapshotPlaylist.data;

    return EmptyWidgetBuilder(
      data: playlist,
      builder: (safePlaylist) {
        return AppBar(
          forceMaterialTransparency: true,
          title: Text(safePlaylist.title ?? emptyString),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
