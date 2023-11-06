import 'package:daily_mind/common_widgets/base_reactive_text_field.dart';
import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/focus_mode_pomodoro_new_flow/presentation/focus_mode_pomodoro_icon.dart';
import 'package:daily_mind/features/focus_mode_pomodoro_new_flow/presentation/focus_mode_pomodoro_working_sessions.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FocusModePomodoroForm extends HookWidget {
  const FocusModePomodoroForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = useMemoized(() {
      return FormGroup({
        'workingSessions': FormControl<int>(value: 0),
        'title': FormControl<String>(value: emptyString),
        'shortBreak': FormControl<int>(value: 5),
        'longBreak': FormControl<int>(value: 15),
        'iconID': FormControl<String>(value: 'learning'),
      });
    }, []);

    return BaseSpacingContainer(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: spacing(4),
          horizontal: spacing(2),
        ),
        decoration: BoxDecoration(
          borderRadius: circularRadius(2),
          color: context.theme.hoverColor,
        ),
        child: ReactiveForm(
          formGroup: formGroup,
          child: ReactiveFormConsumer(builder: (context, formGroup, child) {
            final value = formGroup.value;
            final workingSessions = value['workingSessions'] as int;

            return Column(
              children: space(
                [
                  FocusModePomodoroWorkingSessions(
                    workingSessions: workingSessions,
                  ),
                  const BaseReactiveTextField(
                    title: 'Tiêu đề',
                    formControlName: 'title',
                    decoration: InputDecoration(
                      hintText: 'Có thể là: working, reading, yoya',
                    ),
                  ),
                  const BaseReactiveTextField(
                    title: 'Thời gian nghỉ giữa các pomodoro',
                    formControlName: 'shortBreak',
                    decoration: InputDecoration(
                      suffix: Text('phút'),
                    ),
                  ),
                  const BaseReactiveTextField(
                    title: 'Thời gian nghỉ sau 4 pomodoro',
                    formControlName: 'longBreak',
                    decoration: InputDecoration(
                      suffix: Text('phút'),
                    ),
                  ),
                  FocusModePomodoroIcon(formControlName: 'iconID'),
                ],
                height: spacing(4),
              ),
            );
          }),
        ),
      ),
    );
  }
}
