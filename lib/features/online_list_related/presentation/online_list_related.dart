import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_list_related_header/presentation/online_list_related_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineListRelated extends StatelessWidget {
  final List<Item> fullItems;

  const OnlineListRelated({
    super.key,
    required this.fullItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OnlineListRelatedHeader(),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: fullItems.length,
          separatorBuilder: (context, index) {
            return SizedBox(height: spacing());
          },
          itemBuilder: (context, index) {
            final item = fullItems[index];

            return OnlineItem(
              onTap: () {},
              image: item.image,
              name: item.name,
            );
          },
        ),
      ],
    );
  }
}
