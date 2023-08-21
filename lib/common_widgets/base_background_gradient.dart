import 'package:flutter/material.dart';

class BaseBackgroundGradient extends StatelessWidget {
  const BaseBackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.black87,
          ],
        ),
      ),
    );
  }
}
