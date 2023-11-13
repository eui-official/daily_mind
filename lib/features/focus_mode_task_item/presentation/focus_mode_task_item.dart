import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_shadow.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/focus_icons.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/features/focus_mode_delete_sliable/presentation/focus_mode_delete_sliable.dart';
import 'package:daily_mind/features/focus_mode_edit/presentation/focus_mode_edit.dart';
import 'package:daily_mind/features/focus_mode_session/presentation/focus_mode_session.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_avatar.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_working_session.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeTaskItem extends HookConsumerWidget {
  final Task task;

  const FocusModeTaskItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final focusIcon = focusIcons.firstWhere((icon) => icon.id == task.iconId);

    final onOpenPomodoro = useCallback(
      () async {
        baseBackgroundHandler.onHold();
        baseBackgroundHandler.onTaskInit(task);

        await onShowBottomSheet(
          context,
          child: const FocusModeSession(),
          isScrollControlled: true,
          isDismissible: false,
          enableDrag: false,
        );

        baseBackgroundHandler.onStopHolding();
      },
      [context, task],
    );

    return BaseShadow(
      borderRadius: circularRadius(2),
      color: context.theme.highlightColor,
      child: FocusModeDeleteSliable(
        id: task.id,
        onDeleted: () => db.onDeleteTask(task.id),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onOpenPomodoro,
            child: Container(
              height: spacing(10),
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
                              task.title ?? emptyString,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FocusModeTaskItemWorkingSession(
                              workingSessions: task.workingSessions ?? 0,
                            )
                          ],
                        )
                      ],
                      width: spacing(2),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FocusModeEdit(task: task);
                          },
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
