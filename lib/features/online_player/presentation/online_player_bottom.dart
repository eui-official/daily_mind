import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnlinePlayerBottom extends StatelessWidget {
  final List<Item> fullItems;

  const OnlinePlayerBottom({
    super.key,
    required this.fullItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: spacing(4)),
      color: context.theme.colorScheme.background.withOpacity(0.9),
      child: SafeArea(
        child: OnlineListRelated(
          fullItems: fullItems,
        ),
      ),
    );
  }
}
