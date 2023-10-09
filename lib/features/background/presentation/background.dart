import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:transparent_image/transparent_image.dart';

class Background extends HookWidget {
  final ImageProvider image;

  const Background({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final fadeInImage = useMemoized(() {
      return FadeInImage(
        placeholder: MemoryImage(kTransparentImage),
        image: image,
        fit: BoxFit.cover,
        placeholderFit: BoxFit.cover,
      );
    }, [image]);

    return Stack(
      children: [
        Positioned.fill(child: fadeInImage),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black12,
                Colors.black87,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
