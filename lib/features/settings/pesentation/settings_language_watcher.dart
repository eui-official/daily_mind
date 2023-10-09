import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/setting_watcher/presentation/setting_watcher.dart';
import 'package:daily_mind/features/settings/application/settings.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SettingsLanguageWatcher extends StatelessWidget {
  const SettingsLanguageWatcher({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingWatcher(
      type: 'language',
      onWidgetSettingBuilder: (setting) {
        final language = getLanguage(setting, context);

        return DropdownButtonHideUnderline(
          child: DropdownButton(
            value: language,
            borderRadius: BorderRadius.circular(spacing(2)),
            onChanged: (value) {
              db.onAddSetting(value, "language");
            },
            items: const [
              DropdownMenuItem(
                value: 'vi-VN',
                child: Text('Tiếng Việt'),
              ),
              DropdownMenuItem(
                value: 'en-US',
                child: Text('English'),
              ),
            ],
          ),
        );
      },
    );
  }
}
