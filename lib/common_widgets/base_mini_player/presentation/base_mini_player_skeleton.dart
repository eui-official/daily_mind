import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BaseMiniPlayerSkeleton extends StatelessWidget {
  const BaseMiniPlayerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      ),
    );
  }
}
