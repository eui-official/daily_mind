import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:palette_generator/palette_generator.dart';

class BaseCard extends HookWidget {
  final ImageProvider image;
  final Widget child;
  final double? imageHeight;

  const BaseCard({
    super.key,
    required this.image,
    required this.child,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final paletteGeneratorMemoized =
        useMemoized(() => PaletteGenerator.fromImageProvider(image));
    final paletteGenerator = useFuture(paletteGeneratorMemoized);

    return BaseNullBuilder(
      value: paletteGenerator.data,
      builder: (palette) {
        return Card(
          color: palette.dominantColor?.color ??
              context.theme.colorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacing(2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(spacing(2)),
                  topRight: Radius.circular(spacing(2)),
                ),
                child: Image(
                  image: image,
                  height: imageHeight,
                  width: context.width,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: spacing(2),
                  vertical: spacing(3),
                ),
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}
