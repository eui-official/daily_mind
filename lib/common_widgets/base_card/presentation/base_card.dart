import 'package:daily_mind/common_widgets/base_card/presentation/base_card_image.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseCard extends HookWidget {
  final double? height;
  final double? width;
  final ImageProvider image;
  final VoidCallback? onTap;
  final Widget content;

  const BaseCard({
    super.key,
    required this.content,
    required this.image,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BaseCardImage(
          image: image,
          height: height,
          width: width,
        ),
        Positioned.fill(child: content),
        BaseNullBuilder(
          value: onTap,
          builder: (onTap) {
            return Positioned.fill(
              child: BaseInkWell(
                borderRadius: circularRadius(2),
                onTap: onTap,
              ),
            );
          },
        ),
      ],
    );
  }
}
