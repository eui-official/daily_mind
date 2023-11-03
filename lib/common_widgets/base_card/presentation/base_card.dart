import 'package:daily_mind/common_widgets/base_card/presentation/base_card_gradient.dart';
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
  final Widget content;

  const BaseCard({
    super.key,
    required this.content,
    required this.image,
    this.imageHeight,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final resizedImage = ResizeImage(image, width: 8, height: 8);
    final paletteGeneratorMemoized =
        useMemoized(() => PaletteGenerator.fromImageProvider(resizedImage));
    final paletteGenerator = useFuture(paletteGeneratorMemoized);

    return BaseNullBuilder(
      value: paletteGenerator.data,
      builder: (palette) {
        final color = palette.darkMutedColor?.color.withOpacity(0.6) ??
            context.theme.colorScheme.background;

        return Container(
          decoration: BoxDecoration(boxShadow: kElevationToShadow[24]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(spacing(2)),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BaseCardImage(
                  image: image,
                  imageHeight: imageHeight,
                ),
                BaseCardGradient(color: color),
                content,
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
          ),
        );
      },
    );
  }
}
