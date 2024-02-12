import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:flutter/material.dart';

class OnlinePlayerDetailsExpandButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OnlinePlayerDetailsExpandButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseIconButtonWithTitle(
      iconData: Icons.more_vert_rounded,
      onPressed: onPressed,
    );
  }
}
