import 'package:daily_mind/common_widgets/base_backdrop_filter.dart';
import 'package:daily_mind/common_widgets/base_theme_without_divider.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final List<Widget> footerButtons;

  const BaseScaffold({
    super.key,
    this.footerButtons = const [],
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BaseThemeWithoutDivider(
      child: BaseBackdropFilter(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: child,
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: footerButtons,
            )
          ],
        ),
      ),
    );
  }
}
