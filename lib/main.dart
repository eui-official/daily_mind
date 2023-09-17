import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_applications/env.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/init/presentation/init.dart';
import 'package:daily_mind/features/localization/presentation/localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  final engine = WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Supabase.initialize(
    url: Env.supaBaseProjectUrl,
    anonKey: Env.supaBaseAnonKey,
  );

  await db.init();

  final audioHandler = await AudioService.init(
    builder: () => DailyMindAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'dev.andyng.dailymind.channel.audio',
      androidNotificationChannelName: 'Music Playback',
    ),
  );

  runApp(
    ProviderScope(
      child: Localization(
        child: Init(
          engine: engine,
          audioHandler: audioHandler,
        ),
      ),
    ),
  );
}
