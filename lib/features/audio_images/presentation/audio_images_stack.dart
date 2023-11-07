import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class AudioImages extends StatelessWidget {
  final List<PlaylistItem> items;
  final double size;
  final double radiusSize;

  const AudioImages({
    super.key,
    required this.items,
    this.size = 12,
    this.radiusSize = 1,
  });

  @override
  Widget build(BuildContext context) {
    final item = items.first;
    final offlineAudio = item.id.onGetOfflineAudio;

    return ClipRRect(
      borderRadius: circularRadius(radiusSize),
      child: Container(
        height: spacing(size),
        width: spacing(size),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(offlineAudio.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
