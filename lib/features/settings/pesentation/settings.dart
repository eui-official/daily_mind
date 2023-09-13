import 'package:daily_mind/features/settings/pesentation/settings_language.dart';
import 'package:daily_mind/features/settings/pesentation/settings_theme.dart';
import 'package:daily_mind/features/settings/pesentation/settings_version.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: spacing(5)),
      child: ListView(
        children: const [
          SettingsTheme(),
          SettingsLanguage(),
          SettingsVersion(),
        ],
      ),
    );
  }
}
