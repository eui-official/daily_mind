import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

AsyncSnapshot<PaletteGenerator> useImagePallete(ImageProvider image) {
  final resizedImage = useMemoized(
    () => ResizeImage(
      image,
      width: 8,
      height: 8,
    ),
    [image],
  );

  final paletteGeneratorMemoized = useMemoized(
    () => PaletteGenerator.fromImageProvider(resizedImage),
    [resizedImage],
  );

  final paletteGenerator = useFuture(paletteGeneratorMemoized);

  return paletteGenerator;
}
