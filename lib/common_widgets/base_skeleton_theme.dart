import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BaseSkeletonTheme extends StatelessWidget {
  final Widget child;

  const BaseSkeletonTheme({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: child,
    );
  }
}
