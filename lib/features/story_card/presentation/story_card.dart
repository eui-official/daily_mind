import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_player/presentation/online_player.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_image.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryCard extends HookConsumerWidget {
  final Category category;
  final Item item;
  final List<Item> fullItems;

  const StoryCard({
    super.key,
    required this.category,
    required this.fullItems,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyCardNotifier = ref.read(storyCardProvider.notifier);
    final miniPlayerNotifier = ref.read(miniPlayerProvider.notifier);

    final onOpenPlayerOnline = useCallback(() {
      miniPlayerNotifier.onHide();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (context) {
          return OnlinePlayer(
            image: item.image,
            fullItems: fullItems,
          );
        },
      ).then((value) => miniPlayerNotifier.onShow());
    }, [context, fullItems]);

    final onTap = useCallback(() {
      storyCardNotifier.onPlayItem(item);

      miniPlayerNotifier.onUpdateState(
        MiniPlayerState(
          image: StoryCardImage(image: item.image),
          isShow: true,
          networkType: NetworkType.online,
          onPressed: onOpenPlayerOnline,
          title: item.name,
        ),
      );
    }, [
      item,
      fullItems,
    ]);

    return OnlineItem(
      onTap: onTap,
      image: item.image,
      name: item.name,
    );
  }
}
