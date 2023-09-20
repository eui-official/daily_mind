import 'package:daily_mind/constants/sound_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SoundCardItemBackground extends StatelessWidget {
  final ImageProvider imageProvider;

  const SoundCardItemBackground({
    super.key,
    required this.imageProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight,
      width: itemWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing(3)),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
