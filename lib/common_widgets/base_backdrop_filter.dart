import 'package:daily_mind/common_hooks/use_image_palette.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gradients/gradients.dart';
import 'package:transparent_image/transparent_image.dart';

class BaseBackdropFilter extends HookWidget {
  final BorderRadius borderRadius;
  final Widget? child;
  final ImageProvider? image;

  const BaseBackdropFilter({
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.child,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final pallete = useImagePallete(image ?? MemoryImage(kTransparentImage));

    return BaseNullBuilder(
      value: pallete.data,
      builder: (safePallete) {
        final secondColor = Color.alphaBlend(
          Colors.black45,
          safePallete.dominantColor?.color ??
              safePallete.paletteColors.first.color,
        );

        return ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradientPainter(
                    colors: [
                      Colors.transparent,
                      secondColor,
                    ],
                    stops: const [0, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Container(child: child),
            ],
          ),
        );
      },
    );
  }
}
