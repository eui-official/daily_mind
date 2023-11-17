import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixPlayerItem extends HookConsumerWidget {
  final MixItem item;

  const MixPlayerItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixNotifier = ref.watch(mixProvider.notifier);
    final index = mixNotifier.mixItems.indexOf(item);

    final player = item.player;
    final audio = item.audio;

    return BaseMixEditorItem(
      image: audio.image,
      initVolume: player.volume,
      name: audio.name.tr(),
      onVolumeChanged: (volume) {
        mixNotifier.onVolumeChanged(index, volume);
      },
    );
  }
}
