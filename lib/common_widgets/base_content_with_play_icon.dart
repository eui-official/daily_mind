import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseContentWithPlayIcon extends StatelessWidget {
  final Widget child;

  const BaseContentWithPlayIcon({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: space(
        [
          child,
          Icon(
            Icons.play_circle_fill_outlined,
            size: spacing(5),
            color: context.theme.primaryColor,
          )
        ],
        width: spacing(2),
      ),
    );
  }
}
