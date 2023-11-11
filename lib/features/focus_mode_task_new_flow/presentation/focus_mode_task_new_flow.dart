import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/common_widgets/base_stack_with_bottom_action.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/task.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/focus_mode_task_new_flow/presentation/focus_mode_task_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModeTaskNewFlow extends HookWidget {
  const FocusModeTaskNewFlow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formGroup = useMemoized(() {
      return FormGroup({
        'workingSessions': FormControl<int>(value: 0),
        'title': FormControl<String>(
          value: emptyString,
          validators: [
            Validators.required,
          ],
        ),
        'shortBreak': FormControl<int>(
          value: 5,
          validators: [
            Validators.required,
          ],
        ),
        'longBreak': FormControl<int>(
          value: 15,
          validators: [
            Validators.required,
          ],
        ),
        'iconID': FormControl<String>(value: 'learning'),
      });
    }, []);

    final onCreateANewTask = useCallback(
      () {
        final value = formGroup.value;
        final title = value['title'] as String;
        final workingSessions = value['workingSessions'] as int;
        final shortBreak = value['shortBreak'] as int;
        final longBreak = value['longBreak'] as int;
        final iconID = value['iconID'] as String;

        final newTask = Task()
          ..workingSessions = workingSessions
          ..title = title
          ..shortBreak = shortBreak
          ..longBreak = longBreak
          ..iconId = iconID;

        db.onAddANewTask(newTask);

        context.pop();
      },
      [formGroup],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ReactiveForm(
        formGroup: formGroup,
        child: Stack(
          children: [
            const BaseBackground(),
            BaseStackWithBottomAction(
              bottom: ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  return ElevatedButton(
                    onPressed: formGroup.valid ? onCreateANewTask : emptyNull,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: const Text('Tạo mới nhiệm vụ'),
                  );
                },
              ),
              child: AppBarScrollview(
                title: 'task'.tr(),
                children: const [
                  FocusModeTaskForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
