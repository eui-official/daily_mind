import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:blur/blur.dart';
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
          textStyle: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      isRepeatingAnimation: false,
    ),
    body: body,
    bodyWidget: bodyWidget,
    image: Container(
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
      blurColor: Colors.black87,
      colorOpacity: 0.6,
    ),
    decoration: const PageDecoration(
      fullScreen: true,
      bodyPadding: EdgeInsets.zero,
      imagePadding: EdgeInsets.zero,
    ),
  );
}
