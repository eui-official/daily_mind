import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Background extends StatelessWidget {
  final ImageProvider image;

  const Background({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.black38,
                BlendMode.darken,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.theme.colorScheme.background.withOpacity(0.12),
                context.theme.colorScheme.background.withOpacity(0.87),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
