import 'package:flutter/material.dart';

class SoundCardItemDeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SoundCardItemDeleteButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: IconButton(
        icon: const Icon(Icons.delete_rounded),
        onPressed: onPressed,
      ),
    );
  }
}
