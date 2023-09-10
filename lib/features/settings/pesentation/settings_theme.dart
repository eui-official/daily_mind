import 'package:daily_mind/features/settings/pesentation/settings_theme_bottomsheet.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SettingsTheme extends StatelessWidget {
  const SettingsTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Màu sắc'),
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return const SettingsThemeBottomSheet();
          },
        );
      },
      trailing: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(spacing()),
        ),
      ),
    );
  }
}
