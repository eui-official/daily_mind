import 'package:daily_mind/common_widgets/base_backdrop_filter/base_backdrop_filter.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:transparent_image/transparent_image.dart';

class BaseCardImage extends StatelessWidget {
  final double? height;
  final double? width;
  final ImageProvider image;

  const BaseCardImage({
    required this.image,
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? context.width,
      child: ClipRRect(
        borderRadius: circularRadius(2),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned.fill(
              child: FadeInImage(
                fit: BoxFit.cover,
                image: image,
                placeholder: MemoryImage(kTransparentImage),
              ),
            ),
            BaseBackdropFilter(
              image: image,
              dominantColorOpacity: 0.3,
              lightColorOpacity: 0.6,
            ),
          ],
        ),
      ),
    );
  }
}
