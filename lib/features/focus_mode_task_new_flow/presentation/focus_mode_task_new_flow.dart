import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_task_form/presentation/base_task_form.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModeTaskNewFlow extends HookConsumerWidget {
  const FocusModeTaskNewFlow({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final onCreateANewTask = useCallback(
      (FormGroup formGroup) {
        final value = formGroup.value;
        final title = value['title'] as String;
        final workingSessions = value['workingSessions'] as int;
        final shortBreak = value['shortBreak'] as int;
        final longBreak = value['longBreak'] as int;

        final newTask = Task()
          ..workingSessions = workingSessions
          ..title = title
          ..shortBreak = shortBreak
          ..longBreak = longBreak;

        final id = db.onAddANewTask(newTask);
        final task = db.onGetTask(id);

        onSafeValueBuilder(task, (safeTask) {
          baseBackgroundHandler.onTaskInit(safeTask);
          context.pop();
        });
      },
      [],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BaseTaskForm(
        title: 'task'.tr(),
        buttonTitle: 'Tạo mới',
        onPressed: onCreateANewTask,
      ),
    );
  }
}
