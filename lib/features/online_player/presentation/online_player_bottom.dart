import 'package:collection/collection.dart';
import 'package:daily_mind/common_applications/audio_handler.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_current_item.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerBottom extends HookConsumerWidget {
  final DailyMindAudioHandler audioHandler;
  final Item item;
  final List<Item> fullItems;

  const OnlinePlayerBottom({
    super.key,
    required this.audioHandler,
    required this.fullItems,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = fullItems.indexOf(item);

    final items = useMemoized(
      () {
        final restItems = fullItems
            .whereIndexed((index, element) => index != currentIndex)
            .toList();

        if (currentIndex == 0) {
          return restItems;
        }

        final topItems = restItems.sublist(0, currentIndex);
        final lastItems = restItems.whereNot((item) => topItems.contains(item));

        return [
          ...lastItems,
          ...topItems,
        ];
      },
      [fullItems, currentIndex],
    );

    return Container(
      padding: EdgeInsets.only(bottom: spacing(4)),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black38,
            Colors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            BasePlayerControl(
              audioHandler: audioHandler,
              onNext: audioHandler.onNextItem,
              onPrevious: audioHandler.onPreviousItem,
            ),
            BasePlayerCurrentItem(item: item),
            OnlineListRelated(items: items)
          ],
        ),
      ),
    );
  }
}
