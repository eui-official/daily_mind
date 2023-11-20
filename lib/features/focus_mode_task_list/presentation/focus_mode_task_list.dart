import 'package:daily_mind/features/focus_mode/presentation/focus_mode_provider.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeTaskList extends HookConsumerWidget {
  const FocusModeTaskList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusModeState = ref.watch(focusModeNotifierProvider);

    final onOpenAddNewTask = useCallback(
      () {
        context.push('/focus-mode/task/new');
      },
      [],
    );

    return Wrap(
      children: [
        Container(
          constraints: BoxConstraints(minHeight: context.height / 2),
          child: Material(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(spacing(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Danh sách công việc'),
                      IconButton(
                        onPressed: onOpenAddNewTask,
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  children: focusModeState.map((task) {
                    return FocusModeTaskItem(task: task);
                  }).toList(),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
