import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BaseMusicPlaying extends StatelessWidget {
  final Color? color;
  final double size;

  const BaseMusicPlaying({
    super.key,
    this.color,
    this.size = 2,
  });

  @override
  Widget build(BuildContext context) {
    return BaseNullBuilder(
      value: context.theme.iconTheme.color,
      builder: (safeColor) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            color ?? safeColor,
            BlendMode.modulate,
          ),
          child: Lottie.asset(
            'assets/lottie/music-playing.json',
            width: spacing(size),
            height: spacing(size),
          ),
        );
      },
    );
  }
}