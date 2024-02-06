import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_status_icon.dart';
import 'package:flutter/material.dart';

class BaseContentWithPlayIcon extends StatelessWidget {
  final bool isPlaying;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final Widget child;

  const BaseContentWithPlayIcon({
    super.key,
    required this.child,
    this.isPlaying = false,
    this.crossAxisAlignment = CrossAxisAlignment.end,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          BaseContentStatusIcon(isPlaying: isPlaying),
          child,
        ],
      ),
    );
  }
}
