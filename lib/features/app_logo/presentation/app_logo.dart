import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: Image.asset(
        'assets/images/dove.png',
        color: Colors.white,
        width: 48,
        height: 48,
      ),
    );
  }
}
