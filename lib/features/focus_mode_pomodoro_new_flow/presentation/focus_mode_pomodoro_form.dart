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
        'title': FormControl<String>(value: emptyString),
        'shortBreak': FormControl<int>(value: 5),
        'longBreak': FormControl<int>(value: 15),
        'workingSessions': FormControl<int>(value: 2),
      });
    }, []);

    return BaseSpacingContainer(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: spacing(4),
          horizontal: spacing(2),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(spacing(2)),
          color: context.theme.hoverColor,
        ),
        child: ReactiveForm(
          formGroup: formGroup,
          child: Column(
            children: space(
              [
                const FocusModePomodoroWorkingSessions(),
                ReactiveTextField(
                  formControlName: 'title',
                  decoration: const InputDecoration(
                    labelText: 'Tiêu đề',
                  ),
                ),
                ReactiveTextField(
                  formControlName: 'shortBreak',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Thời gian nghỉ giữa các pomodoro',
                    suffix: Text('phút'),
                  ),
                ),
                ReactiveTextField(
                  formControlName: 'longBreak',
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Thời gian nghỉ sau 4 pomodoro',
                    suffix: Text('phút'),
                  ),
                ),
                const FocusModePomodoroIcon(),
              ],
              height: spacing(4),
            ),
          ),
        ),
      ),
    );
  }
}
