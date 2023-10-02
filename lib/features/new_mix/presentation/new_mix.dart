import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:daily_mind/features/app_bar_filter/presentation/app_bar_filter.dart';
import 'package:daily_mind/features/offline_list_sound/presentation/offline_list_sound.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_button_switcher.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class NewMix extends HookConsumerWidget {
  const NewMix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        flexibleSpace: const AppBarFilter(),
        title: Text('newMix'.tr()),
      ),
      body: Tutorial(
        task: 'newMixTutorial',
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
          alignment: Alignment.center,
          children: [
            StackBackground(
              image: AssetImage(appState.backgroundImage),
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing(2),
                  ),
                  child: const OfflineListSound(),
                ),
              ),
            ),
            Positioned(
              bottom: spacing(4),
              child: NewMixButtonSwitcher(
                key: newMixButtonSwitcherKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
