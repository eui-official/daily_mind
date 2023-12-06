import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/mix_switch/presentation/mix_switch.dart';
import 'package:daily_mind/features/mix_tabbar/presentation/mix_tabbar.dart';
import 'package:daily_mind/features/mix_tabbar/presentation/mix_tabbar_provider.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_keys.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_tasks.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';

class Mix extends HookConsumerWidget {
  const Mix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixTabbarNotifier = ref.read(mixTabbarNotifierProvider.notifier);
    final mixTabbarState = ref.watch(mixTabbarNotifierProvider);
    final appNavigationBarState = ref.watch(appNavigationBarProvider);

    useEffectDelayed(() {
      if (db.onIsFirstTime(kNewMixTutorial) &&
          appNavigationBarState.isMixScreen) {
        ShowCaseWidget.of(context).startShowCase([soundKey]);
      }
    }, [context, appNavigationBarState]);

    return Scaffold(
      body: Stack(
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
    );
  }
}
