import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FocusModePomodoroNewFlow extends StatelessWidget {
  const FocusModePomodoroNewFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BaseBackground(),
          AppBarScrollview(
            title: 'pomodoro'.tr(),
            children: const [],
          ),
        ],
      ),
    );
  }
}
