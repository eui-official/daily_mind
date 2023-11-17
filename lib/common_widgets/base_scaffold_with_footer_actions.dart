import 'dart:ui';

import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseScaffoldWithFooterActions extends StatelessWidget {
  final Widget child;
  final List<Widget> footerButtons;

  const BaseScaffoldWithFooterActions({
    super.key,
    this.footerButtons = const [],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor.withOpacity(0.8),
        body: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: spacing(),
            sigmaY: spacing(),
          ),
          child: child,
        ),
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: footerButtons,
          )
        ],
      ),
    );
  }
}
