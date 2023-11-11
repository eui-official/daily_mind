import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseChip extends StatelessWidget {
  final Color? backgroundColor;
  final String title;
  final VoidCallback onPressed;
  final VoidCallback? onDeleted;
  final Widget? avatar;

  const BaseChip({
    super.key,
    required this.onPressed,
    required this.title,
    this.avatar,
    this.backgroundColor,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return RawChip(
      onPressed: onPressed,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: circularRadius(2),
      ),
      avatar: avatar,
      backgroundColor:
          backgroundColor ?? context.theme.primaryColorDark.withOpacity(0.3),
      label: Text(
        title,
        style: TextStyle(
          color: context.theme.primaryColor,
        ),
      ),
      deleteIconColor: context.theme.primaryColor,
      onDeleted: onDeleted,
    );
  }
}
