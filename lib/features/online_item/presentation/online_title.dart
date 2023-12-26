import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnlineTitle extends StatelessWidget {
  final String title;

  const OnlineTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
