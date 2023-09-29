import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_item_editor.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OfflinePlayerListItem extends StatelessWidget {
  final int playlistId;
  final List<PlaylistItem> items;
  final EdgeInsets padding;

  const OfflinePlayerListItem({
    super.key,
    required this.playlistId,
    required this.items,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: padding,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing(2));
      },
      itemBuilder: (context, index) {
        final item = items[index];

        return OfflinePlayerItemEditor(
          playlistId: playlistId,
          item: item,
        );
      },
    );
  }
}
