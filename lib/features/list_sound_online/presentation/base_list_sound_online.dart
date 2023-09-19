import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_widgets/base_list_sound.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/sound_card_online/presentation/sound_card_online.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseListSoundOnline extends HookConsumerWidget {
  final List<SoundOnlineItem> items;
  final String title;
  final Widget headerTrailing;

  const BaseListSoundOnline({
    super.key,
    required this.items,
    required this.title,
    this.headerTrailing = emptyWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final newMixSelectedState = ref.watch(newMixProvider);

    return BaseListSound(
      items: items,
      title: title,
      onSoundBuilder: (context, index, soundOnlineItem) {
        final isPlaying = soundOnlineItem.id == newMixSelectedState.selectingId;
        final isSelected =
            newMixSelectedState.selectedIds.contains(soundOnlineItem.id);

        return SoundCardOnline(
          backgroundKey: index == 0 ? soundKey : ValueKey(soundOnlineItem.id),
          isPlaying: isPlaying,
          isSelected: isSelected,
          onSelected: newMixSelectedNotifier.onSelected,
          onDeleted: newMixSelectedNotifier.onDeleted,
          soundOnlineItem: soundOnlineItem,
        );
      },
    );
  }
}
