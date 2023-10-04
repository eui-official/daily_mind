import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/features/mini_player/presentation/mini_player_provider.dart';
import 'package:daily_mind/features/online_player/presentation/online_player.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_image.dart';
import 'package:daily_mind/features/story_card/presentation/story_card_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StoryCard extends HookConsumerWidget {
  final Category category;
  final Item item;
  final List<Item> items;

  const StoryCard({
    super.key,
    required this.category,
    required this.items,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyCardNotifier = ref.read(storyCardProvider.notifier);
    final miniPlayerNotifier = ref.read(miniPlayerProvider.notifier);

    final onOpenOnlinePlayer = useCallback(() {
      miniPlayerNotifier.onHide();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (context) {
          return OnlinePlayer(
            image: item.image,
            items: items,
          );
        },
      ).then((value) => miniPlayerNotifier.onShow());
    }, [
      item,
      items,
      context,
    ]);

    final onTap = useCallback(() {
      storyCardNotifier.onPlayItem(item);

      miniPlayerNotifier.onUpdateState(
        MiniPlayerState(
          isShow: true,
          image: StoryCardImage(image: item.image),
          title: item.name,
          networkType: NetworkType.online,
          onPressed: onOpenOnlinePlayer,
        ),
      );
    }, [item, onOpenOnlinePlayer]);

    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: spacing(8),
        height: spacing(6),
        child: BaseNetworkImage(image: item.image),
      ),
      title: Text(
        item.name,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
