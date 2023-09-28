import 'package:daily_mind/features/music_playing/presentation/music_playing.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SoundCardContent extends StatelessWidget {
  final String name;
  final bool isPlaying;
  final bool isLoading;

  const SoundCardContent({
    super.key,
    required this.name,
    required this.isPlaying,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: spacing(2),
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spacing(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: EdgeInsets.only(right: spacing()),
                child: Text(
                  name,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            if (isLoading)
              SizedBox(
                height: spacing(),
                width: spacing(),
                child: const CircularProgressIndicator(strokeWidth: 2),
              ),
            if (isPlaying) const MusicPlaying(),
          ],
        ),
      ),
    );
  }
}
