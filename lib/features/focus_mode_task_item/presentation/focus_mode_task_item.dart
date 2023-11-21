import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/features/focus_mode_delete_sliable/presentation/focus_mode_delete_sliable.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item_selected.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
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
    final taskCurrent = baseBackgroundHandler.taskCurrent;
    final isSelected = taskCurrent.id == task.id;

    final onSelectTask = useCallback(
      () {
        baseBackgroundHandler.onTaskInit(task);
        context.pop();
      },
      [],
    );

    final onDeletedTask = useCallback(
      () {
        db.onDeleteTask(task.id);

        if (isSelected) {
          final tasks = db.onGetTasks();

          if (tasks.isNotEmpty) {
            final firstTask = tasks.first;
            baseBackgroundHandler.onTaskInit(firstTask);
          }
        }
      },
      [isSelected],
    );

    return ClipRRect(
      borderRadius: circularRadius(2),
      child: Material(
        type: MaterialType.transparency,
        child: FocusModeDeleteSliable(
          id: task.id,
          onDeleted: onDeletedTask,
          child: ListTile(
            onTap: onSelectTask,
            title: Text(
              task.title ?? emptyString,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: FocusModeTaskItemSelected(isSelected: isSelected),
          ),
        ),
      ),
    );
  }
}
