import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter_overlay.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

class BaseBackdropFilterGradient extends HookWidget {
  final PaletteGenerator pallete;
  final double dominantColorOpacity;

  const BaseBackdropFilterGradient({
    super.key,
    required this.pallete,
    this.dominantColorOpacity = 0.3,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = useMemoized(
      () {
        final dominantColor =
            pallete.dominantColor?.color ?? context.theme.colorScheme.surface;

        return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            dominantColor,
            context.theme.cardColor.withOpacity(dominantColorOpacity),
          ],
        );
      },
      [pallete],
    );

    return Stack(
      children: [
        BaseBackdropFilterOverlay(gradient: gradient),
        const BaseBackdropFilterOverlay(),
      ],
    );
  }
}
