import 'package:daily_mind/common_widgets/base_skeleton_box.dart';
import 'package:daily_mind/constants/audio_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BaseAudiosSkeleton extends StatelessWidget {
  const BaseAudiosSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: StaggeredGrid.count(
        crossAxisCount: 1,
        mainAxisSpacing: spacing(2),
        crossAxisSpacing: spacing(2),
        children: [
          BaseSkeletonBox(height: tinyCard),
          BaseSkeletonBox(height: tinyCard),
          BaseSkeletonBox(height: tinyCard),
          BaseSkeletonBox(height: largeCard),
          BaseSkeletonBox(height: largeCard),
          BaseSkeletonBox(height: largeCard),
        ],
      ),
    );
  }
}
