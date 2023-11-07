import 'package:daily_mind/common_widgets/base_icon/presentation/play.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/focus_icons.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_avatar.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_working_session.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class FocusModeTaskItem extends StatelessWidget {
  final Pomodoro pomodoro;

  const FocusModeTaskItem({
    super.key,
    required this.pomodoro,
  });

  @override
  Widget build(BuildContext context) {
    final focusIcon =
        focusIcons.firstWhere((icon) => icon.id == pomodoro.iconId);

    return ClipRRect(
      borderRadius: circularRadius(2),
      child: Container(
        decoration: BoxDecoration(
          color: context.theme.hoverColor,
        ),
        height: spacing(10),
        width: spacing(10),
        padding: EdgeInsets.all(spacing(2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: space(
                [
                  FocusModeTaskItemAvatar(icon: focusIcon.icon),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pomodoro.title ?? emptyString,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FocusModeTaskItemWorkingSession(
                        workingSessions: pomodoro.workingSessions ?? 0,
                      )
                    ],
                  )
                ],
                width: spacing(2),
              ),
            ),
            const PlayIcon(),
          ],
        ),
      ),
    );
  }
}
