import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class BaseTabbarItem extends StatelessWidget {
  final String title;

  const BaseTabbarItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        constraints: BoxConstraints(minWidth: spacing(10)),
        padding: EdgeInsets.symmetric(
          vertical: spacing(),
          horizontal: spacing(2),
        ),
        child: Text(
          title.tr(),
          style: context.textTheme.titleMedium,
        ),
      ),
    );
  }
}
