import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BasePlayerInformation extends StatelessWidget {
  final Category category;

  const BasePlayerInformation({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.background,
        borderRadius: circularRadius(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: space(
          [
            Text(
              category.name,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              category.description,
              style: const TextStyle(color: secondaryTextColor),
            ),
          ],
          height: spacing(),
        ),
      ),
    );
  }
}
