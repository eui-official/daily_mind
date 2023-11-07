import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/focus_mode_list_switcher/presentation/focus_mode_list_switcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FocusMode extends StatelessWidget {
  const FocusMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BaseBackground(),
          AppBarScrollview(
            title: 'focus'.tr(),
            children: const [
              FocusModeListSwitcher(),
            ],
          ),
        ],
      ),
    );
  }
}
