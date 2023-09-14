import 'package:daily_mind/db/db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class Tutorial extends HookWidget {
  final String task;
  final Widget child;
  final List<TargetFocus> targets;

  const Tutorial({
    super.key,
    required this.child,
    required this.task,
    required this.targets,
  });

  @override
  Widget build(BuildContext context) {
    final firstTime = useMemoized(
      () => db.getFirstTime(task),
      [],
    );

    useEffect(() {
      if (firstTime == null) {
        TutorialCoachMark(
          targets: targets,
          textSkip: 'Skip',
          onFinish: () {
            db.addFirstTime(task);
          },
          onSkip: () {
            db.addFirstTime(task);
          },
        ).show(context: context);
      }

      return () {};
    }, [firstTime, context]);

    return child;
  }
}
