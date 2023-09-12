import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Background extends StatelessWidget {
  final String image;

  const Background({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.black87,
            BlendMode.overlay,
          ),
        ),
      ),
    ).blurred(
      blurColor: context.theme.scaffoldBackgroundColor,
    );
  }
}
