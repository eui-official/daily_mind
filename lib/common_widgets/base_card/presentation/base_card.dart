import 'package:daily_mind/common_widgets/base_card/presentation/base_card_image.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:palette_generator/palette_generator.dart';

class BaseCard extends HookWidget {
  final double? imageHeight;
  final ImageProvider image;
  final VoidCallback? onTap;
  final Widget child;

  const BaseCard({
    super.key,
    required this.child,
    required this.image,
    this.imageHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final paletteGeneratorMemoized =
        useMemoized(() => PaletteGenerator.fromImageProvider(image));
    final paletteGenerator = useFuture(paletteGeneratorMemoized);

    return BaseNullBuilder(
      value: paletteGenerator.data,
      builder: (palette) {
        final color = palette.dominantColor?.color ??
            context.theme.colorScheme.background;

        return ClipRRect(
          borderRadius: BorderRadius.circular(spacing(2)),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseCardImage(
                    imageHeight: imageHeight,
                    image: image,
                  ),
                  Container(
                    color: color,
                    padding: EdgeInsets.all(spacing(2)),
                    child: child,
                  ),
                ],
              ),
              BaseNullBuilder(
                value: onTap,
                builder: (onTap) {
                  return Positioned.fill(
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(onTap: onTap),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
