import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class PlayIcon extends StatelessWidget {
  final double size;

  const PlayIcon({
    super.key,
    this.size = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      color: context.theme.primaryColor,
      Icons.play_circle_fill_outlined,
      size: spacing(size),
    );
  }
}
