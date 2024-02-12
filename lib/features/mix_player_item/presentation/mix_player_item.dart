import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
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
    final mixNotifier = ref.read(mixProvider.notifier);
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final player = item.player;
    final offlineAudio = item.offlineAudio;

    return BaseMixEditorItem(
      image: offlineAudio.image,
      initVolume: player.volume,
      name: offlineAudio.title.tr(),
      onDeleted: () => mixNotifier.onSelect(offlineAudio),
      onVolumeChanged: (volume) {
        baseBackgroundHandler.onUpdateMixItemVolume(volume, item);
      },
    );
  }
}
