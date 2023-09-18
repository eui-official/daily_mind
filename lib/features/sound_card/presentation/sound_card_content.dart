import 'package:daily_mind/features/music_playing/presentation/music_playing.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SoundCardContent extends StatelessWidget {
  final String name;
  final bool isPlaying;

  const SoundCardContent({
    super.key,
    required this.name,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: spacing(2),
      left: 0,
      right: 0,
      child: Container(
        height: spacing(3),
        padding: EdgeInsets.symmetric(horizontal: spacing(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: context.textTheme.bodyMedium,
            ),
            if (isPlaying) const MusicPlaying(),
          ],
        ),
      ),
    );
  }
}
