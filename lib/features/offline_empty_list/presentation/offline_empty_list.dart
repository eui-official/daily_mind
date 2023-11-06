import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/offline_empty_list/presentation/offline_empty_list_box.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/constant/tasks.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class OfflineEmptyList extends StatelessWidget {
  const OfflineEmptyList({
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
      child: Scaffold(
        body: Stack(
          children: [
            const BaseBackground(),
            AppBarScrollview(
              title: 'naturalSounds'.tr(),
              children: const [
                OfflineEmptyListBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
