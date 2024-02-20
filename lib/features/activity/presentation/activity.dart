import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/sleep_mode/presentation/sleep_mode_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: AppBarScrollview(
        title: 'activity'.tr(),
        children: const [
          SleepModeCard(),
        ],
      ),
    );
  }
}