import 'package:daily_mind/common_widgets/base_item_box_size.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String image;
  final Widget title;

  const OnlineItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: space(
            [
              SizedBox(
                width: spacing(5),
                height: spacing(5),
                child: BaseNetworkImage(image: image),
              ),
              Flexible(child: BaseItemBoxSize(child: title))
            ],
            width: spacing(),
          ),
        ),
      ),
    );
  }
}
