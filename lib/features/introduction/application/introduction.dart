import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blur/blur.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel createPageViewModel(
  BuildContext context, {
  required String title,
  required String image,
  String? body,
  Widget? bodyWidget,
}) {
  return PageViewModel(
    titleWidget: AnimatedTextKit(
      animatedTexts: [
        TyperAnimatedText(
          title,
          textStyle: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      isRepeatingAnimation: false,
    ),
    body: body,
    bodyWidget: bodyWidget,
    image: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container().frosted(
          blur: spacing(),
          frostColor: context.theme.colorScheme.background,
          frostOpacity: 0.5,
        )
      ],
    ),
    decoration: const PageDecoration(
      fullScreen: true,
    ),
  );
}
