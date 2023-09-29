import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseLinearProgressIndicator extends StatelessWidget {
  const BaseLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      minHeight: 2,
      valueColor: AlwaysStoppedAnimation<Color>(context.theme.primaryColor),
      backgroundColor: context.theme.primaryColor.withOpacity(0.3),
    );
  }
}
