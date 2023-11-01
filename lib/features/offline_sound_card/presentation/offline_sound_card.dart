import 'package:daily_mind/common_domains/sound_offline_item.dart';
import 'package:daily_mind/common_providers/audio_offline_player_provider.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineSoundCard extends HookConsumerWidget {
  final bool isSelected;
  final Key? backgroundKey;
  final SoundOfflineItem item;
  final SelectingState selectingState;
  final ValueChanged<String> onDeleted;
  final ValueChanged<SelectingState> onSelecting;
  final VoidCallback onUnSelecting;

  const OfflineSoundCard({
    super.key,
    required this.isSelected,
    required this.item,
    required this.onDeleted,
    required this.onSelecting,
    required this.onUnSelecting,
    required this.selectingState,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final audioOfflinePlayerMemoized = useMemoized(
      () => audioOfflinePlayerProvider(item.id),
      [item.id],
    );
    final audioOfflinePlayerNotifier =
        ref.watch(audioOfflinePlayerMemoized.notifier);
    final audioOfflinePlayerState = ref.watch(audioOfflinePlayerMemoized);

    final onTap = useCallback(() {
      if (audioOfflinePlayerState.isPlaying) {
        onUnSelecting();
        audioOfflinePlayerNotifier.onPause();
      } else {
        onSelecting(
          SelectingState(
            sound: item,
            networkType: NetworkType.offline,
          ),
        );

        audioOfflinePlayerNotifier.onPlay(item.id);
      }
    }, [
      audioOfflinePlayerState.isPlaying,
      item,
    ]);

    useEffect(() {
      if (selectingState.sound?.id != item.id) {
        audioOfflinePlayerNotifier.onPause();
      }

      return () {};
    }, [selectingState, item]);

    useEffect(() {
      return () {
        Future(() {
          newMixSelectedNotifier.onDeleted(item.id);
        });
      };
    }, [item]);

    return BaseSoundCard(
      key: backgroundKey,
      isPlaying: audioOfflinePlayerState.isPlaying,
      isLoading: audioOfflinePlayerState.isLoading,
      isSelected: isSelected,
      onTap: onTap,
      onDeleted: () => onDeleted(item.id),
      image: AssetImage(item.image),
      name: item.name.tr(),
      description: item.description.tr(),
    );
  }
}
