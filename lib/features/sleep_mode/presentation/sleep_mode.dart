import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/sleep_mode_current_time/presentation/sleep_mode_current_time.dart';
import 'package:daily_mind/features/sleep_mode_form/presentation/sleep_mode_form.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_times/presentation/sleep_mode_wake_up_times.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepMode extends HookWidget {
  const SleepMode({super.key});

  @override
  Widget build(BuildContext context) {
    final greeting = useMemoized(
      () {
        final hour = DateTime.now().toUtc().hour;

        if (hour < 12) {
          return 'Chào buổi sáng'.tr();
        }
        if (hour < 17) {
          return 'Chào buổi trưa'.tr();
        }
        return 'Chào buổi tối'.tr();
      },
      [],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AppBarScrollview(
            title: greeting,
            children: space(
              [
                const SleepModeWakeUpTimes(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: spacing(2)),
                  child: const SleepModeCurrentTime(),
                ),
                const SleepModeForm(),
              ],
              height: spacing(3),
            ),
          ),
        ],
      ),
    );
  }
}
