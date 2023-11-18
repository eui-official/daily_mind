import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseThemeWithoutDivider extends StatelessWidget {
  final Widget child;

  const BaseThemeWithoutDivider({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.theme.copyWith(
        dividerTheme: const DividerThemeData(color: Colors.transparent),
      ),
      child: child,
    );
  }
}
