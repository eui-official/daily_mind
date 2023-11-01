import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

class MusicPlaying extends StatelessWidget {
  final Color? color;
  final double size;

  const MusicPlaying({
    super.key,
    this.size = 4,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color ?? context.theme.primaryColor,
        BlendMode.modulate,
      ),
      child: Lottie.asset(
        'assets/lottie/music-playing.json',
        width: spacing(size),
        height: spacing(size),
      ),
    );
  }
}
