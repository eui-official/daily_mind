import 'package:daily_mind/common_applications/base_audio_handler.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/setting_watcher/presentation/setting_watcher.dart';
import 'package:daily_mind/features/settings/application/settings.dart';
import 'package:daily_mind/router/router.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Init extends HookConsumerWidget {
  final DailyMindAudioHandler audioHandler;
  final WidgetsBinding engine;

  const Init({
    super.key,
    required this.audioHandler,
    required this.engine,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(configProvider);
    final baseAudioHandlerNotifier =
        ref.read(baseAudioHandlerProvider.notifier);

    useEffectDelayed(() {
      baseAudioHandlerNotifier.onSetAudioHandler(audioHandler);

      db.streamSetting('language').listen((setting) {
        if (setting.isNotEmpty) {
          final language = getLanguage(setting.first, context).toMapLocale;

          context.setLocale(Locale(language.first, language.last));
          engine.performReassemble();
        }
      });
    }, [context, audioHandler]);

    return SettingWatcher(
      type: 'theme',
      onWidgetSettingBuilder: (setting) {
        final theme = getTheme(setting);

        return MaterialApp.router(
          darkTheme: createDarkTheme(theme),
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          routerConfig: routerConfig,
          supportedLocales: context.supportedLocales,
          theme: createDarkTheme(theme),
          themeMode: ThemeMode.dark,
          title: 'DailyMind',
        );
      },
    );
  }
}
