import 'package:daily_mind/common_widgets/base_audios_builder/presentation/base_audios_builder.dart';
import 'package:daily_mind/features/online_category_group/presentation/online_category_group.dart';
import 'package:daily_mind/features/online_category_without_group/presentation/online_category_without_group.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineExploreList extends StatelessWidget {
  const OnlineExploreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseAudiosBuilder(
      onAudiosBuilder: (context, audioCategoryGroup) {
        List<Widget> children = [];

        audioCategoryGroup.forEach(
          (group, audioCategories) {
            if (group.isEmpty) {
              children.add(
                  OnlineCategoryWithoutGroup(audioCategories: audioCategories));
            } else {
              children
                  .add(OnlineCategoryGroup(audioCategories: audioCategories));
            }
          },
        );

        return Column(
          children: space(
            children,
            height: spacing(3),
          ),
        );
      },
    );
  }
}
