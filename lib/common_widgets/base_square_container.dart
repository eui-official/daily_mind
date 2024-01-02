import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseSquareContainer extends StatelessWidget {
  final Widget child;

  const BaseSquareContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacing(5),
      width: spacing(5),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: circularRadius(),
      ),
      child: child,
    );
  }
}
