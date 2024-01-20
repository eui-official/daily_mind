import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_item_box_size.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/features/online_item/presentation/online_item_playing.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineItem extends StatelessWidget {
  final bool isPlaying;
  final double size;
  final String image;
  final VoidCallback? onTap;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  const OnlineItem({
    super.key,
    required this.image,
    required this.title,
    this.isPlaying = false,
    this.onTap,
    this.size = 5,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: spacing()),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: space(
                [
                  SizedBox(
                    width: spacing(size),
                    height: spacing(size),
                    child: Stack(
                      children: [
                        BaseNetworkImage(
                          image: image,
                          size: size,
                        ),
                        if (isPlaying) const OnlineItemPlaying(),
                      ],
                    ),
                  ),
                  Flexible(
                    child: BaseItemBoxSize(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: title),
                          subtitle,
                        ].whereNotNull().toList(),
                      ),
                    ),
                  ),
                  trailing,
                ].whereNotNull().toList(),
                width: spacing(2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
