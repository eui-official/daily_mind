import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    return Skeletonizer(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
