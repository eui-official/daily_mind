import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/constant/tasks.dart';
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
