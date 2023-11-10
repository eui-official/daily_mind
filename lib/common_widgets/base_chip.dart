import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseChip extends StatelessWidget {
  final Color? backgroundColor;
  final String display;
  final VoidCallback onPressed;
  final VoidCallback? onDeleted;

  const BaseChip({
    super.key,
    required this.display,
    required this.onPressed,
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
      backgroundColor:
          backgroundColor ?? context.theme.primaryColorDark.withOpacity(0.5),
      label: Text(
        display,
        style: TextStyle(
          color: context.theme.primaryColor,
        ),
      ),
      deleteIconColor: context.theme.primaryColor,
      onDeleted: onDeleted,
    );
  }
}
