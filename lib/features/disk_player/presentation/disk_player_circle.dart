import 'dart:math';

import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class DiskPlayerCircle extends HookWidget {
  final String image;

  const DiskPlayerCircle({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(duration: diskDuration)..repeat();

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: animation.value * 2 * pi,
          child: child,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white60),
          boxShadow: kElevationToShadow[4],
          image: DecorationImage(
            image: AssetImage(image),
          ),
        ),
        width: context.width,
        height: context.height / 2,
      ),
    );
  }
}
