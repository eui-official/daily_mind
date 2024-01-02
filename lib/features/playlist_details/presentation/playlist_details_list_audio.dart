import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_sliable.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_item/presentation/online_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PlaylistDetailsListAudio extends HookWidget {
  final OnlinePlaylist onlinePlaylist;
  final List<Audio> audios;

  const PlaylistDetailsListAudio({
    super.key,
    required this.onlinePlaylist,
    required this.audios,
  });

  @override
  Widget build(BuildContext context) {
    final currentAudios = useState<List<Audio>>([]);

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
          return BaseSliable(
            id: audio.id,
            onDeleted: () => onDeleted(audio),
            child: OnlineItem(
              image: audio.image,
              title: OnlineTitle(title: audio.name),
            ),
          );
        }).toList(),
      ),
    );
  }
}