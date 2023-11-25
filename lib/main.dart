import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/base_background_fetch.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/env.dart';
import 'package:daily_mind/common_applications/local_notifications.dart';
import 'package:daily_mind/common_widgets/base_internet_connection_checker/presentation/base_internet_connection_checker.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/init/presentation/init.dart';
import 'package:daily_mind/features/localization/presentation/localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  final engine = WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await db.onInit();
  final backgroundHandler = await AudioService.init(
    builder: () => DailyMindBackgroundHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'dev.andyng.dailymind.channel.background',
      androidNotificationChannelName: 'Music Playback',
    ),
  );
  await baseBackgroundFetch.registerHeadlessTask();
  await baseBackgroundFetch.configure();
  await localNotifications.onInit();

  await Supabase.initialize(
    url: Env.supaBaseProjectUrl,
    anonKey: Env.supaBaseAnonKey,
  );

  runApp(
    ProviderScope(
      child: Localization(
        child: BaseInternetConnectionChecker(
          child: ShowCaseWidget(
            builder: Builder(
              builder: (context) {
                return Init(
                  backgroundHandler: backgroundHandler,
                  engine: engine,
                );
              },
            ),
          ),
        ),
      ),
    ),
  );
}
