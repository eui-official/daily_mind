import 'package:flutter/material.dart';

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
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}
