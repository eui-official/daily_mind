import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class AudioCardDeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AudioCardDeleteButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: spacing(),
      right: spacing(),
      child: IconButton(
        icon: const Icon(Icons.delete_rounded),
        onPressed: onPressed,
      ),
    );
  }
}
