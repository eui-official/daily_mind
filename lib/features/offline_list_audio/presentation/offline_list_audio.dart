import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items_header.dart';
import 'package:daily_mind/constants/offline_audio_items.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/offline_audio_card/presentation/offline_audio_card.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListAudio extends HookConsumerWidget {
  final EdgeInsetsGeometry? padding;

  const OfflineListAudio({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final newMixSelectedState = ref.watch(newMixProvider);

    return BaseGridItemsHeader(
      padding: padding,
      items: offlineAudioItems,
      onItemBuilder: (context, index, item) {
        final isSelected = newMixSelectedState.isContain(item.id);

        return OfflineAudioCard(
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
