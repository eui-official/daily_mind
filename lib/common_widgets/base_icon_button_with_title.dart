import 'package:daily_mind/extensions/context.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';

class BaseIconButtonWithTitle extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;

  const BaseIconButtonWithTitle({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      backgroundColor: backgroundColor ?? context.primaryColorDark50,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: circularRadius(2)),
      side: BorderSide.none,
      avatar: Icon(
        iconData,
        color: Colors.white,
      ),
      label: Text(
        title,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}
