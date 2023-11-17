import 'package:daily_mind/common_widgets/base_animated_opacity.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter.dart';
import 'package:daily_mind/theme/common.dart';
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
          child: Opacity(
            opacity: 0.6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        BaseBackdropFilter(
          child: Container(
            decoration: const BoxDecoration(gradient: baseLinearGradient),
          ),
        )
      ],
    );
  }
}
