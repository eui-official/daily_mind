import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items_header.dart';
import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/features/mix_audio_card/presentation/mix_audio_card.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixListAudio extends HookConsumerWidget {
  final EdgeInsetsGeometry? padding;

  const MixListAudio({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixNotifier = ref.read(mixProvider.notifier);
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final mixItemsSnapshot = useStream(baseBackgroundHandler.onStreamMixItems);
    final mixItems = mixItemsSnapshot.data ?? [];

    return BaseGridItemsHeader(
      padding: padding,
      items: offlineAudios,
      onItemIndexBuilder: (context, index, audio) {
        final isSelected = mixItems.isContain(audio.id);

        return MixAudioCard(
          backgroundKey: index == 0 ? soundKey : ValueKey(audio.id),
          isSelected: isSelected,
          audio: audio,
          onSelecting: mixNotifier.onSelect,
        );
      },
    );
  }
}
