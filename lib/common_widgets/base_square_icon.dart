import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseSquareIcon extends StatelessWidget {
  final IconData iconData;

  const BaseSquareIcon({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: spacing(5),
      height: spacing(5),
      decoration: BoxDecoration(
        color: context.theme.primaryColorDark,
        borderRadius: circularRadius(),
      ),
      child: Icon(iconData),
    );
  }
}
