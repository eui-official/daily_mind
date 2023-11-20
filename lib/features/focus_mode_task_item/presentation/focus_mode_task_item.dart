import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/features/focus_mode_delete_sliable/presentation/focus_mode_delete_sliable.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusModeTaskItem extends StatelessWidget {
  final Task task;

  const FocusModeTaskItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: circularRadius(2),
      child: Material(
        type: MaterialType.transparency,
        child: FocusModeDeleteSliable(
          id: task.id,
          child: ListTile(
            onTap: () {},
            title: Text(
              task.title ?? emptyString,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onDeleted: () {},
        ),
      ),
    );
  }
}
