import 'package:daily_mind/common_widgets/base_animated_opacity.dart';
import 'package:flutter/material.dart';

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
        BaseAnimatedOpacity(
          valueKey: ValueKey(image),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.black87,
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
