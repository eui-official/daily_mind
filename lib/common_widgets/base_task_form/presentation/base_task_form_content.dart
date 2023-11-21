import 'package:daily_mind/common_widgets/base_reactive_text_field.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/features/focus_mode_task_new_flow/presentation/focus_mode_task_working_sessions.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;

class BaseTaskFormContent extends HookWidget {
  const BaseTaskFormContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: space(
            [
              FocusModeTaskWorkingSessions(
                formControlName: 'workingSessions',
              ),
              BaseReactiveTextField(
                title: 'Tiêu đề'.tr(),
                formControlName: 'title',
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Có thể là: working, reading, yoga'.tr(),
                ),
              ),
              BaseReactiveTextField(
                title: 'Thời gian nghỉ giữa các phiên'.tr(),
                formControlName: 'shortBreak',
                decoration: InputDecoration(
                  suffix: Text('phút'.tr()),
                ),
              ),
              BaseReactiveTextField(
                title: 'Thời gian nghỉ sau 4 phiên'.tr(),
                formControlName: 'longBreak',
                decoration: InputDecoration(
                  suffix: Text('phút'.tr()),
                ),
              ),
            ],
            height: spacing(4),
          ),
        ),
      ),
    );
  }
}
