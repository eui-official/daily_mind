import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_player/presentation/online_player.dart';
import 'package:daily_mind/features/online_card/presentation/online_card_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineCard extends HookConsumerWidget {
  final Category category;
  final Item item;
  final List<Item> fullItems;

  const OnlineCard({
    super.key,
    required this.category,
    required this.fullItems,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineCardNotifier = ref.read(onlineCardProvider.notifier);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final onOpenPlayerOnline = useCallback(() {
      baseMiniPlayerNotifier.onHide();

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        builder: (context) {
          return OnlinePlayer(fullItems: fullItems);
        },
      ).then((value) => baseMiniPlayerNotifier.onShow());
    }, [context, fullItems]);

    final onTap = useCallback(() {
      onlineCardNotifier.onPlayItem(
        item,
        fullItems,
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
      fullItems,
      onOpenPlayerOnline,
    ]);

    return OnlineItem(
      onTap: onTap,
      image: item.image,
      title: Text(
        item.name,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
