import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_providers/audio_online_player_provider.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:daily_mind/features/list_sound_online/domain/sound_online_bundle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundCardOnline extends HookConsumerWidget {
  final Key? backgroundKey;
  final bool isSelected;
  final SoundOnlineBundle bundle;
  final String selectingId;
  final ValueChanged<String> onDeleted;
  final ValueChanged<String> onSelected;

  const SoundCardOnline({
    super.key,
    required this.isSelected,
    required this.onDeleted,
    required this.onSelected,
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
        onSelected(soundType.id);

        if (audioOnlinePlayerState.isPlaying) {
          audioOnlinePlayerNotifier.stop();
        } else {
          audioOnlinePlayerNotifier.play(sound.source);
        }
      },
      [
        audioOnlinePlayerState.isPlaying,
        sound,
        soundType,
      ],
    );

    return BaseSoundCard(
      image: CachedNetworkImage(
        fit: BoxFit.cover,
        height: itemHeight,
        imageUrl: firstSound.image,
        width: itemWidth,
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
