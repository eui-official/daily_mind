import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/offline_list_audio/presentation/offline_list_audio.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/constant/tasks.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Mix extends StatelessWidget {
  const Mix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Tutorial(
        task: newMixTutorial,
        targets: [
          TargetFocus(
            keyTarget: soundKey,
            shape: ShapeLightFocus.RRect,
            radius: spacing(2),
            contents: [
              TargetContent(
                child: Text(
                  'newMixTutorialContent1'.tr(),
                ),
              ),
            ],
          ),
          TargetFocus(
            keyTarget: newMixButtonSwitcherKey,
            shape: ShapeLightFocus.RRect,
            radius: spacing(2),
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: Text(
                  'newMixTutorialContent2'.tr(),
                ),
              ),
            ],
          )
        ],
        child: Stack(
          children: [
            const BaseBackground(),
            AppBarScrollview(
              title: 'naturalSounds'.tr(),
              children: [
                OfflineListAudio(
                  padding: EdgeInsets.symmetric(horizontal: spacing(2)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
