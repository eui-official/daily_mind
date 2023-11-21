import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusModeTaskItemSelected extends StatelessWidget {
  final bool isSelected;

  const FocusModeTaskItemSelected({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Icon(
        Icons.check_circle_rounded,
        color: context.theme.primaryColor,
      );
    }

    return emptyWidget;
  }
}
