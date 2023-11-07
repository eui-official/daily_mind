import 'package:daily_mind/common_widgets/base_circular_indicator.dart';
import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_icon/presentation/music_playing.dart';
import 'package:flutter/material.dart';

class AudioCardContent extends StatelessWidget {
  final bool isLoading;
  final bool isPlaying;
  final String description;
  final String name;

  const AudioCardContent({
    super.key,
    required this.name,
    required this.description,
    required this.isLoading,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isLoading) const BaseCircularIndicator(size: 1),
              if (isPlaying) const MusicPlaying(color: Colors.white),
            ],
          ),
          BaseHeaderWithDescription(
            name: name,
            description: description,
          )
        ],
      ),
    );
  }
}
