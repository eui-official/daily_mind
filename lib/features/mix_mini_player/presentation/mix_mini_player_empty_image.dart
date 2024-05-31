import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MixMiniPlayerEmptyImage extends StatelessWidget {
  const MixMiniPlayerEmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Container(
        padding: EdgeInsets.all(spacing()),
        width: spacing(4),
        height: spacing(4),
        decoration: BoxDecoration(
          borderRadius: circularRadius(),
        ),
      ),
    );
  }
}
