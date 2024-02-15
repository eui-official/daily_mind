import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/env.dart';
import 'package:daily_mind/common_widgets/base_internet_connection_checker/presentation/base_internet_connection_checker.dart';
import 'package:daily_mind/common_widgets/base_skeleton_theme.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/init/presentation/init.dart';
import 'package:daily_mind/features/localization/presentation/localization.dart';
import 'package:daily_mind/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  runZonedGuarded(
    () async {
      final engine = WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      await Supabase.initialize(
        url: Env.supaBaseProjectUrl,
        anonKey: Env.supaBaseAnonKey,
        debug: kDebugMode,
      );

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      await db.onInit();
      final backgroundHandler = await AudioService.init(
        builder: () => DailyMindBackgroundHandler(),
        config: const AudioServiceConfig(
          androidNotificationChannelId:
              'dev.andyng.dailymind.channel.background',
          androidNotificationChannelName: 'Music Playback',
        ),
      );

      runApp(
        ProviderScope(
          child: Localization(
            child: BaseInternetConnectionChecker(
              child: Init(
                backgroundHandler: backgroundHandler,
                engine: engine,
              ),
            ),
          ),
        ),
      );
    },
    (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack),
  );
}
