import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/common_widgets/base_sliable.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_item_title/presentation/online_item_title.dart';
import 'package:daily_mind/features/online_player/presentation/online_player_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistDetailsListAudio extends HookConsumerWidget {
  final OnlinePlaylist onlinePlaylist;
  final List<Audio> audios;

  const PlaylistDetailsListAudio({
    super.key,
    required this.onlinePlaylist,
    required this.audios,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final onlinePlayerNotifier = ref.read(onlinePlayerProvider.notifier);
    final onlinePlayerState = ref.read(onlinePlayerProvider);

    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
    final mediaItemSnapshot = useStream(baseBackgroundHandler.mediaItem);

    final currentAudios = useState<List<Audio>>([]);

    final audioId = useMemoized(() {
      final id = mediaItemSnapshot.data?.extras?['id'] ?? kEmptyString;

      return id;
    }, [mediaItemSnapshot.data]);

    final onTap = useCallback(
      (int index) async {
        onlinePlayerNotifier.onUpdateId(onlinePlaylist.id);
        onlinePlayerNotifier.onUpdateTitle(onlinePlaylist.title);

        await baseBackgroundHandler.onInitOnline(
          audios,
          index: index,
        );

        baseMiniPlayerNotifier.onUpdateState(
          const MiniPlayerState(
            isShow: true,
            audioType: AudioTypes.online,
          ),
        );
      },
      [audios, onlinePlaylist],
    );

    final onDeleted = useCallback(
      (Audio audio) {
        db.onDeleteSongInPlaylist(
          onlinePlaylist,
          audio.id,
        );

        final newAudios = List<Audio>.from(currentAudios.value);
        newAudios.remove(audio);

        currentAudios.value = newAudios;
      },
      [onlinePlaylist],
    );

    useEffect(() {
      currentAudios.value = audios;

      return () {};
    }, [audios]);

    return BaseSpacingContainerHorizontal(
      child: Column(
        children: currentAudios.value.map((audio) {
          final index = currentAudios.value.indexOf(audio);
          final isPlaying =
              audioId == audio.id && onlinePlayerState.id == onlinePlaylist.id;

          return BaseSliable(
            id: audio.id,
            onDeleted: () => onDeleted(audio),
            child: OnlineItem(
              image: audio.image,
              isPlaying: isPlaying,
              onTap: () => onTap(index),
              title: OnlineItemTitle(title: audio.name),
            ),
          );
        }).toList(),
      ),
    );
  }
}
