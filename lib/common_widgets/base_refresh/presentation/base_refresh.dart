import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart'
    hide RefreshCallback;

class BaseRefresh extends StatelessWidget {
  final RefreshCallback onRefresh;
  final Widget child;

  const BaseRefresh({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: onRefresh,
      showChildOpacityTransition: false,
      springAnimationDurationInMilliseconds: defaultDuration.inMilliseconds,
      backgroundColor: context.theme.primaryColor,
      color: context.theme.colorScheme.background.withOpacity(0.8),
      child: child,
    );
  }
}
