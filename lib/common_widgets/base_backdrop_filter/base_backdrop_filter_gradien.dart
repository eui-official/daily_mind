import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter_overlay.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

class BaseBackdropFilterGradient extends HookWidget {
  final PaletteGenerator pallete;

  const BaseBackdropFilterGradient({
    super.key,
    required this.pallete,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = useMemoized(
      () {
        final dominantColor = pallete.dominantColor?.color ??
            context.theme.colorScheme.background;
        final lightColor = pallete.lightVibrantColor?.color ??
            context.theme.colorScheme.background;

        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            dominantColor,
            lightColor,
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
