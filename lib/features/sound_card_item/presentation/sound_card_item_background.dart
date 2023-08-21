import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SoundCardItemBackground extends StatelessWidget {
  final String image;

  const SoundCardItemBackground({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing(3)),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}