import 'package:daily_mind/features/settings/pesentation/settings_language_watcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsLanguage extends StatelessWidget {
  const SettingsLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('language'.tr()),
      trailing: const SettingsLanguageWatcher(),
    );
  }
}
