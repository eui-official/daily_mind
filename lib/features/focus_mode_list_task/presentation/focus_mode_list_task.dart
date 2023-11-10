import 'package:daily_mind/features/focus_mode_list/presentation/focus_mode_list_provider.dart';
import 'package:daily_mind/features/focus_mode_task_item/presentation/focus_mode_task_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FocusModeListTask extends HookConsumerWidget {
  const FocusModeListTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusModeListState = ref.watch(focusModeListNotifierProvider);

    return StaggeredGrid.count(
      crossAxisCount: 1,
      mainAxisSpacing: spacing(3),
      children: focusModeListState.map((task) {
        return FocusModeTaskItem(task: task);
      }).toList(),
    );
  }
}
