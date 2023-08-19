import 'package:flutter/material.dart';

class SoundCardItemGradient extends StatelessWidget {
  const SoundCardItemGradient({super.key});

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
