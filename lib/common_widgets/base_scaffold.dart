import 'package:daily_mind/common_widgets/base_backdrop_filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return Theme(
      data: context.theme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: Stack(
        children: [
          const BaseBackdropFilter(),
          Scaffold(
            backgroundColor:
                context.theme.colorScheme.background.withOpacity(0.75),
            body: child,
            persistentFooterButtons: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: footerButtons,
              )
            ],
          ),
        ],
      ),
    );
  }
}
