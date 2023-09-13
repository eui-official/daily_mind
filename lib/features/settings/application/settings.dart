import 'package:daily_mind/db/schemas/settings.dart';
import 'package:daily_mind/features/settings/constants/supported_theme.dart';
import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

SupportedTheme getTheme(Settings? settings) {
  final themeId = settings?.value ?? defaultThemeId;
  final theme = supportedThemes.firstWhere((theme) => theme.id == themeId);

  return theme;
}

String getLanguage(Settings? settings, BuildContext context) {
  final languageCode = context.locale.languageCode;
  final countryCode = context.locale.countryCode;

  final languageId = settings?.value ?? '$languageCode-$countryCode';

  return languageId;
}
