import 'package:daily_mind/common_widgets/base_theme_without_divider.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final List<Widget> persistentFooterButtons;

  const BaseScaffold({
    super.key,
    this.persistentFooterButtons = const [],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BaseThemeWithoutDivider(
      child: Scaffold(
        body: child,
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: persistentFooterButtons,
          )
        ],
      ),
    );
  }
}
