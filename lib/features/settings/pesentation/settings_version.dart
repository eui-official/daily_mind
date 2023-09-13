import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsVersion extends StatelessWidget {
  const SettingsVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          return ListTile(
            title: const Text('Phiên bản'),
            trailing: Text(
              snapshot.data?.version ?? emptyString,
            ),
          );
        });
  }
}