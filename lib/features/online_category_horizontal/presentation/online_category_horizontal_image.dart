import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineCategoryHorizontalImage extends StatelessWidget {
  final String imageUrl;

  const OnlineCategoryHorizontalImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: spacing(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(spacing(2)),
          bottomLeft: Radius.circular(spacing(2)),
        ),
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
