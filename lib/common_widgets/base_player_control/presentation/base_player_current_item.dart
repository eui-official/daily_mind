import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class BasePlayerCurrentItem extends StatelessWidget {
  final Item item;

  const BasePlayerCurrentItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: spacing(4),
            horizontal: spacing(2),
          ),
          child: Text(
            'currentPlaying'.tr(),
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        OnlineItem(
          image: item.image,
          title: BaseMarquee(
            text: item.name,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
