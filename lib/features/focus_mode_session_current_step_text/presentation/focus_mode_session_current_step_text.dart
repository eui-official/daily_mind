import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:daily_mind/features/focus_mode_session/constant/focus_mode_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class FocusModeSessionCurrentStepText extends HookWidget {
  final FocusModeSessionSteps step;
  final int currentSession;
  final int? workingSessions;

  const FocusModeSessionCurrentStepText({
    super.key,
    required this.step,
    required this.currentSession,
    this.workingSessions = 0,
  });

  @override
  Widget build(BuildContext context) {
    final text = useMemoized(
      () {
        switch (step) {
          case FocusModeSessionSteps.ready:
            return 'Sẵn sàng';
          case FocusModeSessionSteps.focusing:
            if (workingSessions == 0) {
              return 'Phiên $currentSession';
            } else {
              return 'Phiên $currentSession của $workingSessions';
            }
          case FocusModeSessionSteps.breakTime:
            return 'Nghỉ ngơi';
          case FocusModeSessionSteps.finish:
            return 'Kết thúc';
        }
      },
      [step, workingSessions],
    );

    return AnimatedTextKit(
      key: ValueKey(text),
      isRepeatingAnimation: false,
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textStyle: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }
}
