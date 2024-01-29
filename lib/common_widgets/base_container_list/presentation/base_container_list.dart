import 'package:daily_mind/common_widgets/base_divider.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
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
    return BaseSpacingContainerHorizontal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: space(
          [
            Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: context.theme.hintColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(borderRadius: circularRadius(2)),
              child: ListView.separated(
                itemBuilder: (context, index) => items[index],
                itemCount: items.length,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const BaseDivider(),
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
