import 'package:blur/blur.dart';
import 'package:daily_mind/common_widgets/base_animated_opacity.dart';
import 'package:daily_mind/theme/theme.dart';
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
        Container().frosted(
          blur: spacing(),
          frostColor: context.theme.colorScheme.background,
          frostOpacity: 0.5,
        )
      ],
    );
  }
}
