import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SettingsPrimaryColor extends StatelessWidget {
  const SettingsPrimaryColor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Màu sắc'),
      onTap: () {},
      trailing: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: BorderRadius.circular(spacing()),
        ),
      ),
    );
  }
}
