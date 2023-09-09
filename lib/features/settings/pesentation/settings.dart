import 'package:daily_mind/features/settings/pesentation/settings_primary_color.dart';
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
          SettingsPrimaryColor(),
          SettingsVersion(),
        ],
      ),
    );
  }
}
