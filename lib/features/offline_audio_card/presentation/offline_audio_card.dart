import 'package:daily_mind/common_domains/audio_offline_item.dart';
import 'package:daily_mind/common_providers/audio_offline_player_provider.dart';
import 'package:daily_mind/common_widgets/base_audio_card.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineAudioCard extends HookConsumerWidget {
  final bool isSelected;
  final Key? backgroundKey;
  final AudioOfflineItem item;
  final SelectingState selectingState;
  final ValueChanged<String> onDeleted;
  final ValueChanged<SelectingState> onSelecting;
  final VoidCallback onUnSelecting;

  const OfflineAudioCard({
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
            audio: item,
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
      if (selectingState.audio?.id != item.id) {
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

    return BaseAudioCard(
      description: item.description.tr(),
      image: AssetImage(item.image),
      isLoading: audioOfflinePlayerState.isLoading,
      isPlaying: audioOfflinePlayerState.isPlaying,
      isSelected: isSelected,
      key: backgroundKey,
      name: item.name.tr(),
      onDeleted: () => onDeleted(item.id),
      onTap: onTap,
    );
  }
}
