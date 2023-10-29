import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Localization extends StatelessWidget {
  final Widget child;

  const Localization({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
      fallbackLocale: const Locale('vi', 'VN'),
      path: 'assets/translations',
      child: child,
    );
  }
}
