import 'package:daily_mind/common_widgets/base_list_sound.dart';
import 'package:daily_mind/constants/sound_items.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSoundOffline extends HookConsumerWidget {
  const ListSoundOffline({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixSelectedProvider.notifier);
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    return BaseListSound(
      title: 'naturalSounds'.tr(),
      items: soundItems,
      onSelected: newMixSelectedNotifier.onSelected,
      onDeleted: newMixSelectedNotifier.onDeleted,
      onSoundBuilder: (context, index, soundItem) {
        final isPlaying = soundItem.id == newMixSelectedState.selectingId;
        final isSelected =
            newMixSelectedState.selectedIds.contains(soundItem.id);

        return SoundCard(
          backgroundKey: index == 0 ? soundKey : ValueKey(soundItem.id),
          isPlaying: isPlaying,
          isSelected: isSelected,
          onSelected: newMixSelectedNotifier.onSelected,
          onDeleted: newMixSelectedNotifier.onDeleted,
          soundItem: soundItem,
        );
      },
    );
  }
}
