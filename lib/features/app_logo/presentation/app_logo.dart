import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: Image.asset(
        'assets/images/dove.png',
        color: context.theme.primaryColor,
        width: 48,
        height: 48,
      ),
    );
  }
}
