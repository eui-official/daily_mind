import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnlineItemSubtitle extends StatelessWidget {
  final String title;

  const OnlineItemSubtitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.bodySmall?.copyWith(
        color: context.theme.hintColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
