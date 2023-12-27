import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_item/presentation/online_title.dart';
import 'package:flutter/material.dart';

class PlaylistDetailsListAudio extends StatelessWidget {
  final List<Audio> audios;

  const PlaylistDetailsListAudio({
    super.key,
    required this.audios,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainerHorizontal(
      child: Column(
        children: audios.map((audio) {
          return OnlineItem(
            image: audio.image,
            title: OnlineTitle(title: audio.name),
          );
        }).toList(),
      ),
    );
  }
}
