import 'package:daily_mind/constants/constants.dart';
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
          case FocusModeSessionSteps.none:
            return emptyString;
          case FocusModeSessionSteps.ready:
            return 'Chuẩn bị bắt đầu';
          case FocusModeSessionSteps.running:
            if (workingSessions == 0) {
              return 'Phiên $currentSession';
            } else {
              return 'Phiên $currentSession của $workingSessions';
            }
          case FocusModeSessionSteps.breakTime:
            return 'Thời gian nghỉ ngơi';
          case FocusModeSessionSteps.finish:
            return 'Đã kết thúc phiên làm việc';
        }
      },
      [step, workingSessions],
    );

    return Text(
      text,
      style: context.textTheme.bodyLarge,
    );
  }
}
