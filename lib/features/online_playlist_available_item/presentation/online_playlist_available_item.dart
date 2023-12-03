import 'package:daily_mind/common_widgets/base_square_icon.dart';
import 'package:flutter/material.dart';

class OnlinePlaylistAvailableItem extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const OnlinePlaylistAvailableItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: const BaseSquareIcon(iconData: Icons.music_note),
      title: Text(title),
    );
  }
}
