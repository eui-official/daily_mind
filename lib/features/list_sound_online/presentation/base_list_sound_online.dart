import 'package:daily_mind/common_domains/sound.dart';
import 'package:daily_mind/common_widgets/base_list_sound.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_online.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseListSoundOnline extends HookConsumerWidget {
  final List<Sound> items;
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
    final newMixSelectedNotifier = ref.read(newMixSelectedProvider.notifier);
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    return BaseListSound(
      items: items,
      title: title,
      onSoundBuilder: (context, index, sound) {
        final isPlaying = sound.id == newMixSelectedState.selectingId;
        final isSelected = newMixSelectedState.selectedIds.contains(sound.id);

        return SoundCardOnline(
          backgroundKey: index == 0 ? soundKey : ValueKey(sound.id),
          isPlaying: isPlaying,
          isSelected: isSelected,
          onSelected: newMixSelectedNotifier.onSelected,
          onDeleted: newMixSelectedNotifier.onDeleted,
          sound: sound,
        );
      },
    );
  }
}
