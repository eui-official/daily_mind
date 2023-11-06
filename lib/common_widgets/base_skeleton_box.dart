import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class BaseSkeletonBox extends StatelessWidget {
  final double? height;
  final double? width;

  const BaseSkeletonBox({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
        height: height,
        width: width,
        borderRadius: BorderRadius.circular(spacing(2)),
      ),
    );
  }
}
