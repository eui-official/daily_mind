import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

final backgroundImages = [
  'assets/images/forest.png',
  'assets/images/red_forest.png'
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
    ).blurred(
      blurColor: context.theme.colorScheme.background,
    );
  }
}
