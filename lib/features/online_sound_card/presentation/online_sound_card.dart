import 'dart:math';

import 'package:daily_mind/common_providers/audio_online_player_provider.dart';
import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/constants/enum.dart';
import 'package:daily_mind/features/online_list_sound/domain/online_sound_bundle.dart';
import 'package:daily_mind/features/new_mix/domain/selecting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineSoundCard extends HookConsumerWidget {
  final Key? backgroundKey;
  final bool isSelected;
  final OnlineSoundBundle bundle;
  final String selectingId;
  final ValueChanged<String> onDeleted;
  final ValueChanged<SelectingState> onSelecting;

  const OnlineSoundCard({
    super.key,
    required this.isSelected,
    required this.onDeleted,
    required this.onSelecting,
    required this.selectingId,
    required this.bundle,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sound = bundle.sounds[Random().nextInt(bundle.sounds.length)];
    final firstSound = bundle.sounds.first;
    final soundType = bundle.soundType;

    final audioOnlinePlayerMemoized =
        useMemoized(() => audioOnlinePlayerProvider(sound.source));
    final audioOnlinePlayerNotifier =
        ref.watch(audioOnlinePlayerMemoized.notifier);
    final audioOnlinePlayerState = ref.watch(audioOnlinePlayerMemoized);

    final onTap = useCallback(
      () {
        onSelecting(
          SelectingState(
            sound: soundType,
            networkType: NetworkType.online,
          ),
        );

        if (audioOnlinePlayerState.isPlaying) {
          audioOnlinePlayerNotifier.onPause();
        } else {
          // audioOnlinePlayerNotifier.onPlay(sound);
        }
      },
      [
        audioOnlinePlayerState.isPlaying,
        sound,
        soundType,
      ],
    );

    useEffect(() {
      if (selectingId != bundle.soundType.id) {
        audioOnlinePlayerNotifier.onPause();
      }

      return () {};
    }, [selectingId, bundle]);

    return BaseSoundCard(
      image: BaseNetworkImage(
        image: firstSound.image,
        size: 20,
      ),
      isPlaying: audioOnlinePlayerState.isPlaying,
      isLoading: audioOnlinePlayerState.isLoading,
      isSelected: isSelected,
      name: soundType.name,
      onDeleted: () => onDeleted(soundType.id),
      onTap: onTap,
    );
  }
}
