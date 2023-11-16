import 'package:daily_mind/common_hooks/use_image_palette.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card_gradient.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card_image.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/common_widgets/base_shadow.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class BaseCard extends HookWidget {
  final double? height;
  final ImageProvider image;
  final VoidCallback? onTap;
  final Widget content;

  const BaseCard({
    super.key,
    required this.content,
    required this.image,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final paletteGenerator = useImagePallete(image);

    return BaseNullBuilder(
      value: paletteGenerator.data,
      builder: (palette) {
        final backgroundColor = palette.darkVibrantColor?.color ??
            context.theme.colorScheme.background;

        return BaseShadow(
          borderRadius: circularRadius(2),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              BaseCardImage(
                image: image,
                height: height,
              ),
              BaseCardGradient(color: backgroundColor),
              Positioned.fill(child: content),
              BaseNullBuilder(
                value: onTap,
                builder: (onTap) {
                  return Positioned.fill(
                    child: BaseInkWell(onTap: onTap),
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
