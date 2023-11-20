import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseMiniTitlePlayer extends StatelessWidget {
  final String title;

  const BaseMiniTitlePlayer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: spacing(2),
      child: BaseMarquee(
        text: title,
        style: context.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
