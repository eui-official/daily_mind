import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_keys.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:showcaseview/showcaseview.dart';

class BaseShowcaseBuilder extends HookWidget {
  final Widget child;

  const BaseShowcaseBuilder({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final onShowcaseComplete = useCallback(
      (int? index, GlobalKey key) {
        if (key == soundKey) {
          db.onAddFirstTime(newMixTutorial);
        }

        if (key == focusModeChangeTaskKey) {
          db.onAddFirstTime(focusModeChangeTaskTutorial);
        }

        if (key == exploreScreenKey) {
          db.onAddFirstTime(exploreScreenTutorial);
        }
      },
      [],
    );

    return ShowCaseWidget(
      onComplete: onShowcaseComplete,
      builder: Builder(
        builder: (context) {
          return child;
        },
      ),
    );
  }
}
