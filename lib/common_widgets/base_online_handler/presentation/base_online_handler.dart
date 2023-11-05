import 'package:daily_mind/common_applications/base_audio_handler/application/base_audio_handler.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/online_player/presentation/online_player.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseOnlineHandler extends HookConsumerWidget {
  final ItemCategory itemCategory;
  final OnOnlineHandlerBuilder builder;

  const BaseOnlineHandler({
    super.key,
    required this.itemCategory,
    required this.builder,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
    final items = itemCategory.items;

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
      baseAudioHandler.onInitOnline(items);

      baseMiniPlayerNotifier.onUpdateState(
        MiniPlayerState(
          isShow: true,
          networkType: NetworkType.online,
          onTap: onOpenPlayerOnline,
        ),
      );
    }, [
      items,
      onOpenPlayerOnline,
    ]);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: builder(onTap),
    );
  }
}
