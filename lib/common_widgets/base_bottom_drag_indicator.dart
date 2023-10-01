import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseBottomDragIndicator extends StatelessWidget {
  const BaseBottomDragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacing(),
      width: spacing(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing()),
        color: context.theme.hintColor,
      ),
    );
  }
}
