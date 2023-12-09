import 'package:daily_mind/common_hooks/use_image_palette.dart';
import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter_gradien.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:transparent_image/transparent_image.dart';

class BaseBackdropFilter extends HookWidget {
  final BorderRadius borderRadius;
  final ImageProvider? image;

  const BaseBackdropFilter({
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final transparentImage = MemoryImage(kTransparentImage);
    final pallete = useImagePallete(image ?? transparentImage);

    return BaseNullBuilder(
      value: pallete.data,
      builder: (safePallete) {
        return BaseBackdropFilterGradient(
          color: safePallete.dominantColor?.color,
        );
      },
    );
  }
}
