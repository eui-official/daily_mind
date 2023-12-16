import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';

class BaseAnimatedSwitcher extends StatelessWidget {
  final Widget child;

  const BaseAnimatedSwitcher({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcherPlus.translationTop(
      duration: kDefaultDuration,
      child: child,
    );
  }
}
