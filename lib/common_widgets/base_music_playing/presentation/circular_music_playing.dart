import 'package:daily_mind/common_widgets/base_music_playing/presentation/base_music_playing.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class CircularMusicPlaying extends StatelessWidget {
  final Color? color;
  final double size;

  const CircularMusicPlaying({
    super.key,
    this.size = 2,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: spacing(2),
      backgroundColor: context.theme.primaryColorDark,
      child: BaseMusicPlaying(
        color: color,
        size: size,
      ),
    );
  }
}
