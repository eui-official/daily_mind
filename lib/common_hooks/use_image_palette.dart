import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

AsyncSnapshot<PaletteGenerator> useImagePallete(ImageProvider image) {
  final paletteGeneratorMemoized = useMemoized(
    () => PaletteGenerator.fromImageProvider(
      image,
      size: Size(
        spacing(),
        spacing(),
      ),
    ),
    [image],
  );

  final paletteGenerator = useFuture(paletteGeneratorMemoized);

  return paletteGenerator;
}
