import 'package:daily_mind/common_widgets/base_empty_list_box.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/features/focus_mode_new_session_button/presentation/focus_mode_new_session_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FocusModeEmptyList extends StatelessWidget {
  const FocusModeEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BaseSpacingContainerHorizontal(
          child: BaseEmptyListBox(
            action: const FocusModeNewSessionButton(),
            imageUrl: 'assets/images/sessions_working.png',
            subTitle: 'focusEmpty'.tr(),
            title: "task".tr(),
          ),
        ),
      ),
    );
  }
}
