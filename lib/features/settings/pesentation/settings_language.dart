import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/setting_watcher/presentation/setting_watcher.dart';
import 'package:daily_mind/features/settings/application/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('language'.tr()),
      trailing: SettingWatcher(
        type: 'language',
        onWidgetSettingBuilder: (setting) {
          final language = getLanguage(setting, context);

          return DropdownButtonHideUnderline(
            child: DropdownButton(
              value: language,
              onChanged: (value) {
                db.addSetting(value, "language");
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
      ),
    );
  }
}
