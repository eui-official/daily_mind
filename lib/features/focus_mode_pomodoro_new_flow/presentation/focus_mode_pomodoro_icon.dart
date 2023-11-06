import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_icon_button.dart';
import 'package:daily_mind/constants/icons.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FocusModePomodoroIcon extends StatelessWidget {
  const FocusModePomodoroIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseContentHeader(
      title: 'Ảnh đại diện',
      spacingSize: 3,
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: spacing(2),
        crossAxisSpacing: spacing(2),
        children: icons.map((icon) {
          return BaseIconButton(icon: icon);
        }).toList(),
      ),
    );
  }
}
