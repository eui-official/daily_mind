import 'package:daily_mind/common_widgets/base_music_playing/presentation/base_music_playing.dart';
import 'package:flutter/material.dart';

class OnlinePlaylistMusicPlaying extends StatelessWidget {
  const OnlinePlaylistMusicPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: const BaseMusicPlaying(),
    );
  }
}
