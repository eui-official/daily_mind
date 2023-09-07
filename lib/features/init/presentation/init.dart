import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_provider.dart';
import 'package:daily_mind/router/router.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Init extends HookConsumerWidget {
  final DailyMindAudioHandler audioHandler;

  const Init({
    super.key,
    required this.audioHandler,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playMixNotifier = ref.read(playMixProvider.notifier);

    useEffect(() {
      playMixNotifier.setAudioHandler(audioHandler);

      return () {};
    }, [audioHandler]);

    return MaterialApp.router(
      title: 'DailyMind',
      theme: darkTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
