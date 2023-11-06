import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_icon_button.dart';
import 'package:daily_mind/constants/focus_icons.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class FocusModePomodoroIcon extends StatelessWidget {
  FocusModePomodoroIcon({super.key});
  final controller = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    return BaseContentHeader(
      title: 'Ảnh đại diện',
      spacingSize: 3,
      child: GroupButton(
        controller: controller,
        buttons: focusIcons,
        buttonBuilder: (selected, focusIcon, context) {
          final index = focusIcons.indexOf(focusIcon);

          return BaseIconButton(
            focusIcon: focusIcon,
            isSelected: selected,
            onTap: () => controller.selectIndex(index),
          );
        },
      ),
    );
  }
}
