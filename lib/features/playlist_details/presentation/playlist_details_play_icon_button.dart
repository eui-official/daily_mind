import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class PlaylistDetailsPlayIconButton extends StatelessWidget {
  final VoidCallback onPlay;

  const PlaylistDetailsPlayIconButton({
    super.key,
    required this.onPlay,
  });

  @override
  Widget build(BuildContext context) {
    final imageHeight = context.height / 3;

    return Positioned(
      top: imageHeight + spacing(2.5),
      right: spacing(3),
      child: CircleAvatar(
        radius: spacing(3),
        child: IconButton(
          color: context.theme.primaryColor,
          onPressed: onPlay,
          icon: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
