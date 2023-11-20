import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/mix_switch/presentation/mix_switch.dart';
import 'package:daily_mind/features/mix_tabbar/presentation/mix_tabbar.dart';
import 'package:daily_mind/features/mix_tabbar/presentation/mix_tabbar_provider.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/constant/tasks.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Mix extends HookConsumerWidget {
  const Mix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixTabbarNotifier = ref.read(mixTabbarNotifierProvider.notifier);
    final mixTabbarState = ref.watch(mixTabbarNotifierProvider);

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
              bottom: const MixTabbar(),
              children: [
                MixSwitch(
                  index: mixTabbarState,
                  onCreateNew: () {
                    mixTabbarNotifier.onTap(0);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
