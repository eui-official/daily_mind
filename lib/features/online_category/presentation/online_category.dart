import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_with_play_icon.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_online_handler/presentation/base_online_handler.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:flutter/material.dart';

class OnlineCategory extends StatelessWidget {
  final ItemCategory itemCategory;

  const OnlineCategory({
    super.key,
    required this.itemCategory,
  });

  @override
  Widget build(BuildContext context) {
    return BaseOnlineHandler(
      itemCategory: itemCategory,
      builder: (onTap) {
        return BaseCard(
          onTap: onTap,
          imageHeight: largeCard,
          image: CachedNetworkImageProvider(itemCategory.items.first.image),
          content: BaseContentWithPlayIcon(
            child: Flexible(
              child: BaseHeaderWithDescription(
                name: itemCategory.category.name,
                description: itemCategory.category.description,
              ),
            ),
          ),
        );
      },
    );
  }
}
