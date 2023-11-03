import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items_header.dart';
import 'package:daily_mind/constants/sound_items.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/offline_sound_card/presentation/offline_sound_card.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListSound extends HookConsumerWidget {
  final EdgeInsetsGeometry? padding;

  const OfflineListSound({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final newMixSelectedState = ref.watch(newMixProvider);

    return BaseGridItemsHeader(
      padding: padding,
      items: soundOfflineItems,
      onItemBuilder: (context, index, item) {
        final isSelected = newMixSelectedState.isContain(item.id);

        return OfflineSoundCard(
          backgroundKey: index == 0 ? soundKey : ValueKey(item.id),
          isSelected: isSelected,
          item: item,
          onDeleted: newMixSelectedNotifier.onDeleted,
          onSelecting: newMixSelectedNotifier.onSelecting,
          onUnSelecting: newMixSelectedNotifier.onUnSelecting,
          selectingState: newMixSelectedState.selectingState,
        );
      },
    );
  }
}
