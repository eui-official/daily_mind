import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/features/sleep_mode/domain/sleep_mode_state.dart';
import 'package:daily_mind/features/sleep_mode_tracker/presentation/sleep_mode_current_time.dart';
import 'package:daily_mind/features/sleep_mode_tracker/presentation/sleep_mode_tracker_end_time.dart';
import 'package:daily_mind/features/sleep_mode_tracker/presentation/sleep_mode_tracker_moon.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeTracker extends HookWidget {
  final SleepModeState sleepModeState;

  const SleepModeTracker({
    super.key,
    required this.sleepModeState,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseSpacingContainer(
          alignment: Alignment.center,
          child: Column(
            children: space(
              [
                Container(
                  padding: const EdgeInsets.only(bottom: kToolbarHeight),
                  child: Text(
                    'Theo dõi giấc ngủ'.tr(),
                    style: context.textTheme.titleLarge,
                  ),
                ),
                const SleepModeTrackerMoon(),
                Column(
                  children: space(
                    [
                      const SleepModeCurrentTime(),
                      SleepModeTrackerEndTime(endTime: sleepModeState.endTime),
                    ],
                    height: spacing(),
                  ),
                )
              ],
              height: spacing(4),
            ),
          ),
        ),
      ),
    );
  }
}
