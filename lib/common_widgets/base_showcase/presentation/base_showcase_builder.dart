import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_keys.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:showcaseview/showcaseview.dart';

class BaseShowcaseBuilder extends HookWidget {
  final WidgetBuilder builder;

  const BaseShowcaseBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final onShowcaseComplete = useCallback(
      (int? index, GlobalKey key) {
        if (key == soundKey) {
          db.onAddFirstTime(kNewMixTutorial);
        }

        if (key == focusModeChangeTaskKey) {
          db.onAddFirstTime(kFocusModeChangeTaskTutorial);
        }

        if (key == exploreScreenKey) {
          db.onAddFirstTime(kExploreScreenTutorial);
        }
      },
      [],
    );

    return ShowCaseWidget(
      onComplete: onShowcaseComplete,
      builder: Builder(builder: builder),
    );
  }
}
