import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_providers/audio_online_player_provider.dart';
import 'package:daily_mind/common_widgets/base_sound_card.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundCardOnline extends HookConsumerWidget {
  final Key? backgroundKey;
  final bool isSelected;
  final SoundOnlineItem soundOnlineItem;
  final String selectingId;
  final ValueChanged<String> onDeleted;
  final ValueChanged<String> onSelected;

  const SoundCardOnline({
    super.key,
    required this.isSelected,
    required this.onDeleted,
    required this.onSelected,
    required this.selectingId,
    required this.soundOnlineItem,
    this.backgroundKey,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioOnlinePlayerMemoized =
        useMemoized(() => audioOnlinePlayerProvider(soundOnlineItem.source));
    final audioOnlinePlayerNotifier =
        ref.watch(audioOnlinePlayerMemoized.notifier);
    final audioOnlinePlayerState = ref.watch(audioOnlinePlayerMemoized);

    final onTap = useCallback(
      () {
        onSelected(soundOnlineItem.id);

        if (audioOnlinePlayerState.isPlaying) {
          audioOnlinePlayerNotifier.stop();
        } else {
          audioOnlinePlayerNotifier.play(soundOnlineItem.source);
        }
      },
      [audioOnlinePlayerState.isPlaying, soundOnlineItem],
    );

    useEffect(() {
      if (selectingId != soundOnlineItem.id) {
        audioOnlinePlayerNotifier.stop();
      }

      return () {};
    }, [selectingId]);

    return BaseSoundCard(
      image: CachedNetworkImage(
        fit: BoxFit.cover,
        height: itemHeight,
        imageUrl: soundOnlineItem.image,
        width: itemWidth,
      ),
      isPlaying: audioOnlinePlayerState.isPlaying,
      isLoading: audioOnlinePlayerState.isLoading,
      isSelected: isSelected,
      name: soundOnlineItem.name,
      onDeleted: () => onDeleted(soundOnlineItem.id),
      onTap: onTap,
    );
  }
}
