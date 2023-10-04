import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineListRelated extends StatelessWidget {
  final List<Item> listItem;

  const OnlineListRelated({
    super.key,
    required this.listItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listItem.length,
      itemBuilder: ((context, index) {
        return Container();
      }),
      separatorBuilder: (context, index) {
        return SizedBox(height: spacing());
      },
    );
  }
}
