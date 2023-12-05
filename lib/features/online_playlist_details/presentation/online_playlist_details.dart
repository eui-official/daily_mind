import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:flutter/material.dart';

class OnlinePlaylistDetails extends StatelessWidget {
  final int playlistId;

  const OnlinePlaylistDetails({
    super.key,
    required this.playlistId,
  });

  @override
  Widget build(BuildContext context) {
    return const AppBarScrollview(
      title: 'Playlist',
      children: [],
    );
  }
}
