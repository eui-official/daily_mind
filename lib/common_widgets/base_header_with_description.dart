import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseHeaderWithDescription extends StatelessWidget {
  final int? maxLines;
  final String description;
  final String name;
  final TextOverflow? overflow;
  final Widget headerAction;

  const BaseHeaderWithDescription({
    super.key,
    required this.description,
    required this.name,
    this.headerAction = emptyWidget,
    this.maxLines,
    this.overflow,
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
                Flexible(
                  child: Text(
                    name,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              headerAction,
            ],
          ),
          Flexible(
            child: Text(
              description,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: secondaryTextColor,
              ),
              maxLines: maxLines,
              overflow: overflow,
            ),
          )
        ],
        height: spacing(),
      ),
    );
  }
}
