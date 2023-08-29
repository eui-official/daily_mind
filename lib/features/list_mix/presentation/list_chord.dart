import 'package:daily_mind/db/db.dart';
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
    final playlistSnapshot = useStream(db.getAllPlaylists());
    final playlists = playlistSnapshot.data ?? [];

    return ListView.separated(
      itemCount: playlists.length,
      itemBuilder: (context, index) {
        final playlist = playlists[index];

        return ListChordItem(playlist: playlist);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing());
      },
    );
  }
}
