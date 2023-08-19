import 'dart:ui';

import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class AppBarFilter extends StatelessWidget {
  const AppBarFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: spacing(), sigmaY: spacing()),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
