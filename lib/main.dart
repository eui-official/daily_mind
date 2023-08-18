import 'package:daily_mind/router/router.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DailyMind',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: routerConfig,
    );
  }
}
