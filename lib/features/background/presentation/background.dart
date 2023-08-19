import 'package:blur/blur.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

final backgroundImages = [
  'assets/images/forrest.png',
  'assets/images/red_forrest.png'
];

class Background extends StatelessWidget {
  final int backgroundIndex;

  const Background({
    super.key,
    this.backgroundIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImages[backgroundIndex]),
          fit: BoxFit.cover,
        ),
      ),
    ).blurred(blurColor: background);
  }
}
