import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_audios_builder/presentation/base_audios_builder.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_keys.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_tasks.dart';
import 'package:daily_mind/common_widgets/base_showcase/presentation/base_showcase.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_navigation_bar/presentation/app_navigation_bar_provider.dart';
import 'package:daily_mind/features/online_category_group/presentation/online_category_group.dart';
import 'package:daily_mind/features/online_category_without_group/presentation/online_category_without_group.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';

class OnlineExploreList extends HookConsumerWidget {
  const OnlineExploreList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appNavigationState = ref.watch(appNavigationBarProvider);

    useEffectDelayed(
      () {
        if (db.onIsFirstTime(exploreScreenTutorial) &&
            appNavigationState.isExploreScreen) {
          ShowCaseWidget.of(context).startShowCase([exploreScreenKey]);
        }
      },
      [context, appNavigationState],
    );

    return BaseShowcase(
      description:
          'Danh mục Khám phá cần kết nối mạng để sử dụng. Ngược lại với Âm thanh thiên nhiên bạn có thể sử dụng ngoại tuyến'
              .tr(),
      showcaseKey: exploreScreenKey,
      child: BaseAudiosBuilder(
        onAudiosBuilder: (context, audioCategoryGroup) {
          List<Widget> children = [];

          audioCategoryGroup.forEach(
            (group, audioCategories) {
              if (group.isEmpty) {
                children.add(OnlineCategoryWithoutGroup(
                    audioCategories: audioCategories));
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
      ),
    );
  }
}
