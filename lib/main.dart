import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/router/router.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await db.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DailyMind',
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}
