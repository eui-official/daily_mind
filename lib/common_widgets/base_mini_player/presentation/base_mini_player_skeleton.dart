import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

class BaseMiniPlayerSkeleton extends StatelessWidget {
  const BaseMiniPlayerSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: SkeletonLine(
        style: SkeletonLineStyle(
          height: spacing(7),
          width: context.width,
          borderRadius: circularRadius(),
        ),
      ),
    );
  }
}
