import 'dart:ui';

import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Tutorial extends HookWidget {
  final String task;
  final Widget child;
  final List<TargetFocus> targets;
  final bool condition;

  const Tutorial({
    super.key,
    required this.child,
    required this.targets,
    required this.task,
    this.condition = true,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final isFirstTime = db.isFirstTime(task);

      if (isFirstTime) {
        Future.delayed(
          defaultDuration,
          () {
            TutorialCoachMark(
              focusAnimationDuration: defaultDuration,
              unFocusAnimationDuration: defaultDuration,
              imageFilter: ImageFilter.blur(
                sigmaX: spacing(),
                sigmaY: spacing(),
              ),
              targets: targets,
              textSkip: 'skip'.tr(),
              onFinish: () {
                db.addFirstTime(task);
              },
              onSkip: () {
                db.addFirstTime(task);
              },
            ).show(context: context);
          },
        );
      }

      return () {};
    }, [
      condition,
      context,
    ]);

    return child;
  }
}
