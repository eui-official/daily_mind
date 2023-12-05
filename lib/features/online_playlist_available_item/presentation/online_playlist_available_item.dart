import 'package:daily_mind/common_widgets/base_sliable.dart';
import 'package:daily_mind/common_widgets/base_square_icon.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:flutter/material.dart';

class OnlinePlaylistAvailableItem extends StatelessWidget {
  final VoidCallback onTap;
  final OnlinePlaylist onlinePlaylist;

  const OnlinePlaylistAvailableItem({
    super.key,
    required this.onlinePlaylist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSliable(
      id: onlinePlaylist.id,
      onDeleted: () => db.onDeleteOnlinePlaylist(onlinePlaylist.id),
      child: BaseTile(
        onTap: onTap,
        leading: const BaseSquareIcon(iconData: Icons.music_note),
        title: onlinePlaylist.title ?? emptyString,
      ),
    );
  }
}
