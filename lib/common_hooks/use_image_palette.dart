import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:palette_generator/palette_generator.dart';

const kImageSizeForExtractingColor = 8;

AsyncSnapshot<PaletteGenerator> useImagePallete(ImageProvider image) {
  final resizeImaged = useMemoized(() {
    return ResizeImage(
      image,
      width: kImageSizeForExtractingColor,
      height: kImageSizeForExtractingColor,
    );
  }, [image]);

  final paletteGeneratorMemoized = useMemoized(
    () => PaletteGenerator.fromImageProvider(resizeImaged),
    [resizeImaged],
  );

  final paletteGenerator = useFuture(paletteGeneratorMemoized);

  return paletteGenerator;
}
