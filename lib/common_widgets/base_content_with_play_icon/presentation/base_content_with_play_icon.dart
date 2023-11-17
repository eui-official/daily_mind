import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_status_icon.dart';
import 'package:flutter/material.dart';

class BaseContentWithPlayIcon extends StatelessWidget {
  final bool isPlaying;
  final Color? iconColor;
  final Widget child;

  const BaseContentWithPlayIcon({
    super.key,
    required this.child,
    this.iconColor,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BaseContentStatusIcon(
            isPlaying: isPlaying,
            iconColor: iconColor,
          ),
          child,
        ],
      ),
    );
  }
}
