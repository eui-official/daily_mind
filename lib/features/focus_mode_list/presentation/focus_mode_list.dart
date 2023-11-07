import 'package:daily_mind/features/focus_mode_list_task/presentation/focus_mode_list_task.dart';
import 'package:daily_mind/features/focus_mode_new_session_button/presentation/focus_mode_new_session_button.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class FocusModeList extends StatelessWidget {
  const FocusModeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: space(
          [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'taskList'.tr(),
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const FocusModeNewSessionButton(),
              ],
            ),
            const FocusModeListTask(),
          ],
          height: spacing(4),
        ),
      ),
    );
  }
}
