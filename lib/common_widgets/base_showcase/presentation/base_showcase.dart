import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:showcaseview/showcaseview.dart';

class BaseShowcase extends StatelessWidget {
  final GlobalKey showcaseKey;
  final String description;
  final String? title;
  final Widget child;

  const BaseShowcase({
    super.key,
    required this.child,
    required this.description,
    required this.showcaseKey,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: showcaseKey,
      title: title,
      description: description,
      tooltipBackgroundColor: context.theme.primaryColorDark,
      descTextStyle: context.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      child: child,
    );
  }
}
