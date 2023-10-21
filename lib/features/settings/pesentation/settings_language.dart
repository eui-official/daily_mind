import 'package:daily_mind/features/settings/pesentation/settings_language_watcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsLanguage extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;

  const SettingsLanguage({
    super.key,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: contentPadding,
      title: Text('language'.tr()),
      trailing: const SettingsLanguageWatcher(),
    );
  }
}
