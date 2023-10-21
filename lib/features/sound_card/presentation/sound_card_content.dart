import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.only(right: spacing()),
            child: Text(
              name,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        if (isLoading) const BaseCircularIndicator(size: 1),
        if (isPlaying) const MusicPlaying(),
      ],
    );
  }
}
