import 'package:collection/collection.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:daily_mind/features/settings/constants/supported_theme.dart';
import 'package:daily_mind/features/settings/domain/supported_theme.dart';

SupportedTheme getTheme(Settings? settings) {
  final themeId = settings?.value ?? kDefaultThemeId;
  final theme =
      kSupportedThemes.firstWhereOrNull((theme) => theme.id == themeId);

  return theme ?? kDefaultTheme;
}
