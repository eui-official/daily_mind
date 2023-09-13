import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/settings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingWatcherProvider extends StateNotifier<Settings?> {
  final String type;

  SettingWatcherProvider({
    required this.type,
  }) : super(Settings()) {
    init();
  }

  void init() {
    final setting = db.getSetting(type);

    state = setting;

    db.streamSetting(type).listen((settings) {
      if (settings.isNotEmpty) {
        state = settings.first;
      }
    });
  }
}

final settingWatcherProvider =
    StateNotifierProvider.family<SettingWatcherProvider, Settings?, String>(
  (ref, type) {
    return SettingWatcherProvider(type: type);
  },
);
