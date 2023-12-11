import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class DiskPlayerImage extends HookWidget {
  final String image;

  const DiskPlayerImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.width / 2;

    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: circularRadius(2),
        child: CachedNetworkImage(
          imageUrl: image,
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
