import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

const kImageSizeForExtractColors = Size(1, 1);

AsyncSnapshot<PaletteGenerator> useImagePallete(ImageProvider image) {
  final paletteGeneratorMemoized = useMemoized(
    () => PaletteGenerator.fromImageProvider(
      image,
      size: kImageSizeForExtractColors,
    ),
    [image],
  );

  final paletteGenerator = useFuture(paletteGeneratorMemoized);

  return paletteGenerator;
}
