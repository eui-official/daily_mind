import 'package:flutter/material.dart';

class SoundCardOverlay extends StatelessWidget {
  final VoidCallback onTap;

  const SoundCardOverlay({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(onTap: onTap),
    );
  }
}
