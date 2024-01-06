import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/common_widgets/base_item_box_size.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/features/online_item/presentation/online_item_playing.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineItem extends StatelessWidget {
  final bool isPlaying;
  final String image;
  final VoidCallback? onTap;
  final Widget title;

  const OnlineItem({
    super.key,
    required this.image,
    required this.title,
    this.isPlaying = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: spacing()),
        child: Row(
          children: space(
            [
              SizedBox(
                width: spacing(5),
                height: spacing(5),
                child: Stack(
                  children: [
                    BaseNetworkImage(image: image),
                    if (isPlaying) const OnlineItemPlaying(),
                  ],
                ),
              ),
              Flexible(child: BaseItemBoxSize(child: title))
            ],
            width: spacing(2),
          ),
        ),
      ),
    );
  }
}
