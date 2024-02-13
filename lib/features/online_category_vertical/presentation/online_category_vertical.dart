import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon/presentation/base_content_with_play_icon.dart';
import 'package:daily_mind/common_widgets/base_online_handler/presentation/base_online_handler.dart';
import 'package:daily_mind/constants/audio_card_sizes.dart';
import 'package:daily_mind/features/online_category_vertical/presentation/online_category_vertical_content.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineCategoryVertical extends HookConsumerWidget {
  final AudioCategory audioCategory;
  final double? height;
  final double? width;
  final EdgeInsets padding;

  const OnlineCategoryVertical({
    super.key,
    required this.audioCategory,
    this.padding = EdgeInsets.zero,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlinePlayerState = ref.watch(onlinePlayerNotifierProvider);
    final category = audioCategory.category;

    final image = useMemoized(
      () => CachedNetworkImageProvider(category.image),
      [category],
    );

    final isPlaying = onlinePlayerState.id == category.id;

    return BaseOnlineHandler(
      audioCategory: audioCategory,
      padding: padding,
      builder: (onTap) {
        return BaseCard(
          onTap: onTap,
          height: height ?? kSmallCard,
          width: width ?? kSmallCard,
          image: image,
          content: BaseContentWithPlayIcon(
            isPlaying: isPlaying,
            child: OnlineCategoryVerticalContent(
              name: audioCategory.category.name,
            ),
          ),
        );
      },
    );
  }
}
