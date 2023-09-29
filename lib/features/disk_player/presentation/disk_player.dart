import 'package:daily_mind/features/disk_player/presentation/disk_player_circle.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class DiskPlayer extends StatelessWidget {
  final bool isPlaying;
  final String image;

  const DiskPlayer({
    super.key,
    required this.isPlaying,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        DiskPlayerCircle(
          isPlaying: isPlaying,
          image: image,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white54,
            shape: BoxShape.circle,
          ),
          width: context.width / 4,
          height: context.height / 4,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black87,
            shape: BoxShape.circle,
          ),
          width: context.width / 6,
          height: context.height / 6,
        ),
        const OfflinePlayerToggleButton(),
      ],
    );
  }
}
