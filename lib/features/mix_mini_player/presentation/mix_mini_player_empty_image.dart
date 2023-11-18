import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class MixMiniPlayerEmptyImage extends StatelessWidget {
  const MixMiniPlayerEmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
        padding: EdgeInsets.all(spacing()),
        width: spacing(4),
        height: spacing(4),
        borderRadius: circularRadius(),
      ),
    );
  }
}
