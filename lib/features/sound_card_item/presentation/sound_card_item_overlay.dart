import 'package:flutter/material.dart';

class SoundCardItemOverlay extends StatelessWidget {
  final VoidCallback onTap;

  const SoundCardItemOverlay({
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
