import 'package:blur/blur.dart';
import 'package:daily_mind/theme/theme.dart';
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
          colorFilter: ColorFilter.mode(
            context.theme.primaryColor,
            BlendMode.overlay,
          ),
        ),
      ),
    ).blurred(
      blur: spacing(),
      blurColor: context.theme.scaffoldBackgroundColor,
    );
  }
}
