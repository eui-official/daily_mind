import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/settings/application/settings.dart';
import 'package:daily_mind/features/settings/constants/supported_theme.dart';
import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchThemeProvider extends StateNotifier<SupportedTheme> {
  WatchThemeProvider() : super(defaultTheme) {
    init();
  }

  void init() {
    final themeSetting = db.getTheme();

    state = getTheme(themeSetting);

    db.streamTheme().listen((setting) {
      state = getTheme(setting.first);
    });
  }
}

final watchThemeProvider =
    StateNotifierProvider<WatchThemeProvider, SupportedTheme>((ref) {
  return WatchThemeProvider();
});
