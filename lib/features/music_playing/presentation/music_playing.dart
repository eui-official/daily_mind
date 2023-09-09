import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MusicPlaying extends StatelessWidget {
  const MusicPlaying({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/music-playing.json',
      width: spacing(3),
      height: spacing(3),
    );
  }
}
