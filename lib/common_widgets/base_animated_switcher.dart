import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';

class BaseAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final AnimatedSwitcherTransitionBuilder transitionBuilder;

  const BaseAnimatedSwitcher({
    super.key,
    required this.child,
    this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: defaultDuration,
      transitionBuilder: transitionBuilder,
      child: child,
    );
  }
}
