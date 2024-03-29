import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseDivider extends StatelessWidget {
  const BaseDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      color: context.theme.dividerColor.withOpacity(0.5),
    );
  }
}
