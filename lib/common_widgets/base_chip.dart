import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseChip extends StatelessWidget {
  final String display;
  final VoidCallback? onDeleted;
  final VoidCallback onPressed;

  const BaseChip({
    super.key,
    required this.display,
    required this.onPressed,
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
      backgroundColor: context.theme.primaryColorDark,
      label: Text(display),
      onDeleted: onDeleted,
    );
  }
}
