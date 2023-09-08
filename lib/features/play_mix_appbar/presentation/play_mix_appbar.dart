import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/empty_widget_builder/presentation/empty_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final int playlistId;

  const PlayMixAppBar({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamPlaylist = useMemoized(() => db.streamPlaylistById(playlistId));
    final playlists = useStream(streamPlaylist);
    final playlist = playlists.data?.first;

    return EmptyWidgetBuilder(
      data: playlist,
      builder: (checkedPlaylist) {
        return AppBar(
          forceMaterialTransparency: true,
          title: Text(checkedPlaylist.title ?? emptyString),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
