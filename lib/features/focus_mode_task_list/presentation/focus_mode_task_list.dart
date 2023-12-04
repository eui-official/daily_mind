import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_bottom_sheet.dart';
import 'package:daily_mind/features/focus_mode/presentation/focus_mode_provider.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
        BaseSpacingBottomSheet(
          child: BaseContentHeader(
            title: 'Danh sách công việc',
            trailing: IconButton(
              onPressed: onOpenAddNewTask,
              icon: const Icon(Icons.add),
            ),
            child: Column(
              children: space(
                focusModeState.map((task) {
                  return FocusModeTaskItem(task: task);
                }).toList(),
                height: spacing(2),
              ),
            ),
          ),
        )
      ],
    );
  }
}
