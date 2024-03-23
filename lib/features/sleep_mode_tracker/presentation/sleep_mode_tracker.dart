import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/features/sleep_mode_tracker/presentation/sleep_mode_tracker_moon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SleepModeTracker extends StatelessWidget {
  const SleepModeTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theo dõi giấc ngủ'.tr()),
      ),
      body: const BaseSpacingContainer(
        padding: EdgeInsets.symmetric(vertical: kToolbarHeight),
        alignment: Alignment.center,
        child: Column(
          children: [
            SleepModeTrackerMoon(),
          ],
        ),
      ),
    );
  }
}
