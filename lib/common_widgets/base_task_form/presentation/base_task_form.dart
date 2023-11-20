import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/common_widgets/base_scaffold.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/common_widgets/base_task_form/presentation/base_task_form_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:reactive_forms/reactive_forms.dart';

class BaseTaskForm extends HookWidget {
  final String title;
  final String buttonTitle;
  final ValueChanged<FormGroup> onPressed;
  final ValueChanged<FormGroup>? onUpdateValue;

  const BaseTaskForm({
    super.key,
    required this.title,
    required this.buttonTitle,
    required this.onPressed,
    this.onUpdateValue,
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
      });
    }, []);

    final onPressedInternal = useCallback(
      () {
        onPressed(formGroup);
      },
      [formGroup],
    );

    useEffectDelayed(() {
      onUpdateValue?.call(formGroup);
    }, []);

    return ReactiveForm(
      formGroup: formGroup,
      child: Stack(
        children: [
          const BaseBackground(),
          BaseScaffold(
            footerButtons: [
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  return ElevatedButton(
                    onPressed: formGroup.valid ? onPressedInternal : emptyNull,
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromHeight(48),
                    ),
                    child: Text(buttonTitle),
                  );
                },
              )
            ],
            child: AppBarScrollview(
              title: title,
              children: const [
                BaseTaskFormContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
