import 'package:daily_mind/theme/theme.dart';
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
      top: spacing(2),
      right: spacing(2),
      child: IconButton(
        icon: const Icon(Icons.delete_rounded),
        onPressed: onPressed,
      ),
    );
  }
}
