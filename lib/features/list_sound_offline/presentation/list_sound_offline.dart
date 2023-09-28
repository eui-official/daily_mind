import 'package:daily_mind/common_widgets/base_list_sound.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/sound_items.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/sound_card_offline/presentation/sound_card_offline.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListSoundOffline extends HookConsumerWidget {
  const ListSoundOffline({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final newMixSelectedState = ref.watch(newMixProvider);

    return BaseListSound(
      title: 'naturalSounds'.tr(),
      items: soundOfflineItems,
      onSoundBuilder: (context, index, item) {
        final isSelected = newMixSelectedState.isContain(item.id);

        return SoundCardOffline(
          backgroundKey: index == 0 ? soundKey : ValueKey(item.id),
          isSelected: isSelected,
          item: item,
          onDeleted: newMixSelectedNotifier.onDeleted,
          onSelecting: newMixSelectedNotifier.onSelecting,
          selectingId:
              newMixSelectedState.selectingState.sound?.id ?? emptyString,
        );
      },
    );
  }
}
