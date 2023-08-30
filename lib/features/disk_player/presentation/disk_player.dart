import 'package:daily_mind/features/disk_player/presentation/disk_player_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class DiskPlayer extends StatelessWidget {
  final String image;

  const DiskPlayer({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        DiskPlayerCircle(image: image),
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
          width: context.width / 8,
          height: context.height / 8,
        ),
      ],
    );
  }
}
