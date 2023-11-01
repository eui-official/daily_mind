import 'package:daily_mind/common_widgets/base_container.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_status_icon.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class BaseContentWithPlayIcon extends StatelessWidget {
  final Widget child;
  final bool isPlaying;

  const BaseContentWithPlayIcon({
    super.key,
    required this.child,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: space(
          [
            child,
            BaseContentStatusIcon(isPlaying: isPlaying),
          ],
          width: spacing(2),
        ),
      ),
    );
  }
}
