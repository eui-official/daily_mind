import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  final Widget child;
  final Widget trailing;

  const ListHeader({
    super.key,
    this.trailing = emptyWidget,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacing(6),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          child,
          trailing,
        ],
      ),
    );
  }
}
