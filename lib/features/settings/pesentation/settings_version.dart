import 'package:daily_mind/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsVersion extends HookWidget {
  const SettingsVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final fromPlatformMemoized =
        useMemoized(() => PackageInfo.fromPlatform(), []);
    final packageInfoSnapshot = useFuture(fromPlatformMemoized);

    final appVersion = useMemoized(() {
      final data = packageInfoSnapshot.data;

      if (packageInfoSnapshot.hasData) {
        return '${data?.version}+${data?.buildNumber}';
      }

      return emptyString;
    }, [packageInfoSnapshot]);

    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        return ListTile(
          title: Text('version'.tr()),
          trailing: Text(appVersion),
        );
      },
    );
  }
}
