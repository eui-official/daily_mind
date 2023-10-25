import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_content_with_play_icon.dart';
import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:daily_mind/features/online_player/presentation/online_player.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineCategory extends HookConsumerWidget {
  final ItemCategory itemCategory;

  const OnlineCategory({
    super.key,
    required this.itemCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final items = itemCategory.items;
    final item = items.first;

    final onOpenPlayerOnline = useCallback(() {
      baseMiniPlayerNotifier.onHide();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (context) {
          return const OnlinePlayer();
        },
      ).then((value) => baseMiniPlayerNotifier.onShow());
    }, [context]);

    final onTap = useCallback(() {
      baseAudioHandler.onInitOnline(
        item,
        items,
      );

      baseMiniPlayerNotifier.onUpdateState(
        MiniPlayerState(
          isShow: true,
          networkType: NetworkType.online,
          onTap: onOpenPlayerOnline,
        ),
      );
    }, [
      item,
      items,
      onOpenPlayerOnline,
    ]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: BaseCard(
        onTap: onTap,
        imageHeight: imageHeight,
        image: CachedNetworkImageProvider(itemCategory.items.first.image),
        child: BaseContentWithPlayIcon(
          child: Flexible(
            child: BaseHeaderWithDescription(
              name: itemCategory.category.name,
              description: itemCategory.category.description,
            ),
          ),
        ),
      ),
    );
  }
}
