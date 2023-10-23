import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseHeaderWithDescription extends StatelessWidget {
  final String name;
  final String description;

  const BaseHeaderWithDescription({
    super.key,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: space(
        [
          if (name.isNotEmpty)
            Text(
              name,
              style: context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          Flexible(
            child: Text(
              description,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.theme.hintColor,
              ),
            ),
          )
        ],
        height: spacing(),
      ),
    );
  }
}
