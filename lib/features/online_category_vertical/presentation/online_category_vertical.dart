import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_with_play_icon.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_online_handler/presentation/base_online_handler.dart';
import 'package:daily_mind/constants/audio_card_sizes.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineCategoryVertical extends HookConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerProvider);

    return BaseOnlineHandler(
      audioCategory: audioCategory,
      padding: padding,
      builder: (onTap) {
        return BaseCard(
          onTap: onTap,
          height: imageHeight ?? kLargeCard,
          image: CachedNetworkImageProvider(audioCategory.category.image),
          content: BaseContentWithPlayIcon(
            isPlaying: onlinePlayerState.id == audioCategory.category.id,
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
