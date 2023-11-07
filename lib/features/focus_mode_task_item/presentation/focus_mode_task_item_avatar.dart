import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FocusModeTaskItemAvatar extends StatelessWidget {
  final String icon;

  const FocusModeTaskItemAvatar({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(1.5)),
      decoration: BoxDecoration(
        color: context.theme.primaryColorDark,
        borderRadius: BorderRadius.circular(spacing(2)),
      ),
      child: Image.asset(
        icon,
        color: Colors.white,
      ),
    );
  }
}
