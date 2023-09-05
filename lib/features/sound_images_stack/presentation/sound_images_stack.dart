import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:flutter/material.dart';

class SoundImagesStack extends StatelessWidget {
  final List<PlaylistItem> items;

  const SoundImagesStack({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final item = items.first;
    final soundItem = item.id.soundItem;

    return Container(
      height: 96,
      width: 96,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(soundItem.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
