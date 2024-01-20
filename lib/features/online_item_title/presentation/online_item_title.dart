import 'package:flutter/material.dart';

class OnlineItemTitle extends StatelessWidget {
  final String title;

  const OnlineItemTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
