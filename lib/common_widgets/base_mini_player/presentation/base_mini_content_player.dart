import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseMiniPlayerContent extends StatelessWidget {
  final String subtitle;
  final Duration remaining;

  const BaseMiniPlayerContent({
    super.key,
    required this.subtitle,
    required this.remaining,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: space(
        [
          if (subtitle.isNotEmpty)
            Text(
              subtitle,
              style: context.textTheme.bodySmall?.copyWith(
                color: secondaryTextColor,
              ),
            ),
          if (remaining != Duration.zero)
            Text(
              dateFormatter.onFormatDuration(remaining),
              style: context.textTheme.bodySmall?.copyWith(
                color: secondaryTextColor,
              ),
            ),
        ],
        width: spacing(2),
      ),
    );
  }
}
