import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BaseContainerList<T> extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const BaseContainerList({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(spacing(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: space(
          [
            Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.theme.hintColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.theme.cardColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(spacing(2)),
              ),
              child: ListView.separated(
                itemBuilder: (context, index) => items[index],
                itemCount: items.length,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const Divider(height: 0),
                shrinkWrap: true,
              ),
            ),
          ],
          height: spacing(2),
        ),
      ),
    );
  }
}
