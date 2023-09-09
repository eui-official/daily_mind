import 'package:flutter/material.dart';

class SettingsVersion extends StatelessWidget {
  const SettingsVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Phiên bản'),
      onTap: () {},
      trailing: const Text(
        '3.12',
      ),
    );
  }
}
