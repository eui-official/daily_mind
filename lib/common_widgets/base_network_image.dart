import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseNetworkImage extends StatelessWidget {
  final String image;
  final double size;

  const BaseNetworkImage({
    super.key,
    required this.image,
    this.size = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: circularRadius(),
      child: CachedNetworkImage(
        imageUrl: image,
        fit: BoxFit.cover,
        width: spacing(size),
        height: spacing(size),
      ),
    );
  }
}
