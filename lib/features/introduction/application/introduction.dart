import 'package:blur/blur.dart';
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
    image: Image.asset(
      image,
      height: context.height,
      fit: BoxFit.cover,
    ).blurred(blurColor: context.theme.scaffoldBackgroundColor),
    decoration: const PageDecoration(
      fullScreen: true,
      bodyPadding: EdgeInsets.zero,
      imagePadding: EdgeInsets.zero,
    ),
  );
}
