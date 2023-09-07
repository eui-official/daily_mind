import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/empty_list_mix/presentation/empty_list_mix.dart';
import 'package:daily_mind/features/list_mix/presentation/list_chord_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ListChord extends HookWidget {
  const ListChord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final streamPlaylist = useMemoized(db.getAllPlaylists, []);
    final playlistSnapshot = useStream(streamPlaylist);
    final playlists = playlistSnapshot.data ?? [];

    if (playlists.isEmpty) {
      return const EmptyListMix();
    }

    return ListView.separated(
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlist = playlists[index];

        return ListChordItem(
          key: ValueKey(playlist.id),
          playlist: playlist,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing());
      },
    );
  }
}
