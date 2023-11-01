import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MusicPlaying extends StatelessWidget {
  final Color? color;
  final double? width;
  final double? height;

  const MusicPlaying({
    super.key,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        color ?? Colors.white,
        BlendMode.modulate,
      ),
      child: Lottie.asset(
        'assets/lottie/music-playing.json',
        width: width ?? spacing(3),
        height: height ?? spacing(3),
        fit: BoxFit.cover,
      ),
    );
  }
}
