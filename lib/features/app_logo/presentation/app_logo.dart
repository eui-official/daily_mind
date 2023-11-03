import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: Image.asset(
        'assets/images/dove.png',
        color: Colors.white,
        width: 48,
        height: 48,
      ),
    );
  }
}
