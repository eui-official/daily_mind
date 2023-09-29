import 'package:flutter/material.dart';

class BaseLinearProgressIndicator extends StatelessWidget {
  const BaseLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      minHeight: 2,
    );
  }
}
