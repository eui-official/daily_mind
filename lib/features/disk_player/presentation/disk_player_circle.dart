import 'dart:math';

import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class DiskPlayerCircle extends HookWidget {
  final bool isPlaying;
  final ImageProvider image;

  const DiskPlayerCircle({
    super.key,
    required this.image,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final animation = useAnimationController(duration: diskDuration)..repeat();

    useEffect(() {
      if (isPlaying) {
        animation.repeat();
      } else {
        animation.stop();
      }

      return () {};
    }, [isPlaying]);

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
          boxShadow: kElevationToShadow[4],
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
        width: context.width,
        height: context.height / 2.75,
      ),
    );
  }
}
