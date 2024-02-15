import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:skeletons/skeletons.dart';

class BaseSkeletonTheme extends StatelessWidget {
  final Widget child;

  const BaseSkeletonTheme({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      themeMode: ThemeMode.dark,
      darkShimmerGradient: LinearGradient(
        colors: [
          context.theme.colorScheme.background.withOpacity(0.1),
          context.theme.primaryColorDark.withOpacity(0.1),
          context.theme.colorScheme.background.withOpacity(0.2),
          context.theme.primaryColorDark.withOpacity(0.2),
          context.theme.colorScheme.background.withOpacity(0.1),
        ],
        stops: const [
          0.0,
          0.2,
          0.5,
          0.8,
          1,
        ],
      ),
      child: child,
    );
  }
}
