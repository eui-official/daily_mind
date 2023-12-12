import 'package:daily_mind/common_applications/date_formatter.dart';
import 'package:daily_mind/common_hooks/use_timer.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseMiniPlayerContent extends HookConsumerWidget {
  final String subtitle;

  const BaseMiniPlayerContent({
    super.key,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remaining = useTimer(ref);

    final child = useMemoized(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    }, [
      subtitle,
      remaining,
    ]);

    return child;
  }
}
