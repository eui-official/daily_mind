import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/features/music_playing/presentation/music_playing.dart';
import 'package:flutter/material.dart';

class SoundCardContent extends StatelessWidget {
  final String name;
  final String description;
  final bool isPlaying;
  final bool isLoading;

  const SoundCardContent({
    super.key,
    required this.name,
    required this.description,
    required this.isPlaying,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return BaseHeaderWithDescription(
      name: name,
      description: description,
      headerAction: Row(
        children: [
          if (isLoading) const BaseCircularIndicator(size: 1),
          if (isPlaying) const MusicPlaying(),
        ],
      ),
    );
  }
}
