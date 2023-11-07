import 'package:flutter/material.dart';

class BaseCardImage extends StatelessWidget {
  final double? imageHeight;

  final ImageProvider image;

  const BaseCardImage({
    super.key,
    required this.image,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imageHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
