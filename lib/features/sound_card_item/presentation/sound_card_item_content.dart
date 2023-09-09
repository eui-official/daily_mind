import 'package:daily_mind/features/music_playing/presentation/music_playing.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SoundCardItemContent extends StatelessWidget {
  final String name;
  final bool isPlaying;

  const SoundCardItemContent({
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
        padding: EdgeInsets.symmetric(horizontal: spacing(2)),
        height: spacing(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: context.textTheme.titleMedium,
            ),
            if (isPlaying) const MusicPlaying(),
          ],
        ),
      ),
    );
  }
}
