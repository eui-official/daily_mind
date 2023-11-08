import 'package:daily_mind/common_domains/audio_offline.dart';
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
  final AudioOffline audio;
  final SelectingState selectingState;
  final ValueChanged<String> onDeleted;
  final ValueChanged<SelectingState> onSelecting;
  final VoidCallback onUnSelecting;

  const OfflineAudioCard({
    super.key,
    required this.isSelected,
    required this.audio,
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
      () => audioOfflinePlayerProvider(audio.id),
      [audio.id],
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
            audio: audio,
            audioType: AudioTypes.offline,
          ),
        );

        audioOfflinePlayerNotifier.onPlay(audio.id);
      }
    }, [
      audioOfflinePlayerState.isPlaying,
      audio,
    ]);

    useEffect(() {
      if (selectingState.audio?.id != audio.id) {
        audioOfflinePlayerNotifier.onPause();
      }

      return () {};
    }, [selectingState, audio]);

    useEffect(() {
      return () {
        Future(() {
          newMixSelectedNotifier.onDeleted(audio.id);
        });
      };
    }, [audio]);

    return BaseAudioCard(
      description: audio.description.tr(),
      image: AssetImage(audio.image),
      isLoading: audioOfflinePlayerState.isLoading,
      isPlaying: audioOfflinePlayerState.isPlaying,
      isSelected: isSelected,
      key: backgroundKey,
      name: audio.name.tr(),
      onDeleted: () => onDeleted(audio.id),
      onTap: onTap,
    );
  }
}
