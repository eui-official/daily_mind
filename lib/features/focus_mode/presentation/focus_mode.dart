import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:flutter/material.dart';

class FocusMode extends StatelessWidget {
  const FocusMode({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BaseBackground(),
        ],
      ),
    );
  }
}
