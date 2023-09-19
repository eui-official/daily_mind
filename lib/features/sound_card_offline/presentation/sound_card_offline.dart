import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/common_providers/audio_offline_player_provider.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/sound_card/presentation/sound_card_item_background.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundCardOffline extends HookConsumerWidget {
  final Key? backgroundKey;
  final SoundOfflineItem item;

  const SoundCardOffline({
    super.key,
    required this.item,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioOfflinePlayerMemoized =
        useMemoized(() => audioOfflinePlayerProvider(item.id));

    final audioOfflinePlayerNotifier =
        ref.watch(audioOfflinePlayerMemoized.notifier);
    final audioOfflinePlayerState = ref.watch(audioOfflinePlayerMemoized);
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final newMixSelectedState = ref.watch(newMixProvider);

    final isSelected = newMixSelectedState.selectedIds.contains(item.id);

    final onTap = useCallback(() {
      newMixSelectedNotifier.onSelected(item.id);

      if (audioOfflinePlayerState.isPlaying) {
        audioOfflinePlayerNotifier.stop();
      } else {
        audioOfflinePlayerNotifier.play(item.id);
      }
    }, [
      audioOfflinePlayerState.isPlaying,
      item,
    ]);

    useEffect(() {
      if (newMixSelectedState.selectingId != item.id) {
        audioOfflinePlayerNotifier.stop();
      }

      return () {};
    }, [newMixSelectedState.selectingId]);

    return BaseSoundCard(
      isPlaying: audioOfflinePlayerState.isPlaying,
      isLoading: audioOfflinePlayerState.isLoading,
      isSelected: isSelected,
      onTap: onTap,
      onDeleted: () => newMixSelectedNotifier.onDeleted(item.id),
      image: SoundCardItemBackground(
        key: backgroundKey,
        imageProvider: AssetImage(item.image),
      ),
      name: item.name.tr(),
    );
  }
}
