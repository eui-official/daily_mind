import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnlineItemSubtitle extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const OnlineItemSubtitle({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ??
          context.textTheme.bodySmall?.copyWith(
            color: context.theme.hintColor,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
