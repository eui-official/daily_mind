import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/empty_list_mix/presentation/empty_list_mix_box.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/constant/tasks.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class EmptyListMix extends StatelessWidget {
  const EmptyListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tutorial(
      task: addNewMixTutorial,
      targets: [
        TargetFocus(
          keyTarget: addNewMixKey,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Text('addNewMixTutorialContent'.tr()),
            ),
          ],
        ),
      ],
      child: AppBarScrollview(
        title: 'naturalSounds'.tr(),
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: spacing(2),
              vertical: spacing(2),
            ),
            child: const EmptyListMixBox(),
          ),
        ],
      ),
    );
  }
}
