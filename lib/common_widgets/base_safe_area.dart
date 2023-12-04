import 'package:flutter/material.dart';

class BaseSafeArea extends StatelessWidget {
  final Widget child;

  const BaseSafeArea({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
      child: child,
    );
  }
}
