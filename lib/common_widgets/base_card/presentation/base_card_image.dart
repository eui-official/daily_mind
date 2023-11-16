import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class BaseCardImage extends StatelessWidget {
  final double? height;
  final double? width;

  final ImageProvider image;

  const BaseCardImage({
    super.key,
    required this.image,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: circularRadius(),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
