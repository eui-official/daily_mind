import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseHeaderWithDescription extends StatelessWidget {
  final String description;
  final String name;
  final Widget headerAction;

  const BaseHeaderWithDescription({
    super.key,
    required this.description,
    required this.name,
    this.headerAction = emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: space(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (name.isNotEmpty)
                Text(
                  name,
                  style: context.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              headerAction,
            ],
          ),
          Flexible(
            child: Text(
              description,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
        height: spacing(),
      ),
    );
  }
}
