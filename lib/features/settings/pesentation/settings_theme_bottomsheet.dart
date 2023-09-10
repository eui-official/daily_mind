import 'package:daily_mind/common_widgets/base_list_view_header.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/settings/constants/supported_theme.dart';
import 'package:daily_mind/features/settings/pesentation/settings_theme_color_box.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsThemeBottomSheet extends StatelessWidget {
  const SettingsThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseListViewHeader(
      title: 'Danh sách màu sắc',
      child: Flexible(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: spacing(2)),
          children: supportedThemes.map((theme) {
            return ListTile(
              onTap: () {
                db.addTheme(theme.id);
                context.pop();
              },
              leading: SettingsThemeColorBox(scheme: theme.scheme),
              title: Text(theme.title),
            );
          }).toList(),
        ),
      ),
    );
  }
}
