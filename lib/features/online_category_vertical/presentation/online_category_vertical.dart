import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_with_play_icon.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_online_handler/presentation/base_online_handler.dart';
import 'package:daily_mind/constants/audio_card.dart';
import 'package:flutter/material.dart';

class OnlineCategoryVertical extends StatelessWidget {
  final AudioCategory audioCategory;
  final double? imageHeight;
  final EdgeInsets? padding;

  const OnlineCategoryVertical({
    super.key,
    required this.audioCategory,
    this.imageHeight,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return BaseOnlineHandler(
      audioCategory: audioCategory,
      padding: padding,
      builder: (onTap) {
        return BaseCard(
          onTap: onTap,
          imageHeight: imageHeight ?? largeCard,
          image: CachedNetworkImageProvider(audioCategory.audios.first.image),
          content: BaseContentWithPlayIcon(
            child: Flexible(
              child: BaseHeaderWithDescription(
                name: audioCategory.category.name,
                description: audioCategory.category.description,
              ),
            ),
          ),
        );
      },
    );
  }
}
