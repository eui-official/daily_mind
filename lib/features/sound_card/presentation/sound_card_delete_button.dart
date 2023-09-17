import 'package:flutter/material.dart';

class SoundCardDeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SoundCardDeleteButton({
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
