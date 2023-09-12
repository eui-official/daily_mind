import 'package:blur/blur.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:introduction_screen/introduction_screen.dart';

PageViewModel createPageViewModel(
  BuildContext context, {
  required String title,
  required String body,
  required String image,
}) {
  return PageViewModel(
    title: title,
    body: body,
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
      blurColor: context.theme.colorScheme.background,
    ),
    decoration: const PageDecoration(
      fullScreen: true,
      bodyPadding: EdgeInsets.zero,
      imagePadding: EdgeInsets.zero,
    ),
  );
}
