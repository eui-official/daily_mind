import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:flutter/material.dart';

class SoundImagesStack extends StatelessWidget {
  final List<PlaylistItem> items;
  final double height;
  final double width;

  const SoundImagesStack({
    super.key,
    required this.items,
    this.height = 96,
    this.width = 96,
  });

  @override
  Widget build(BuildContext context) {
    final item = items.first;
    final soundItem = item.id.soundItem;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(soundItem.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
