import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class EmptyListMix extends StatelessWidget {
  const EmptyListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing(2)),
        color: context.theme.colorScheme.background.withOpacity(0.4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: space(
          [
            Text(
              "Chưa có playlist nào",
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/playlist.png',
              width: 128,
              height: 128,
              color: context.theme.primaryColor,
            ),
          ],
          height: spacing(2),
        ),
      ),
    );
  }
}
