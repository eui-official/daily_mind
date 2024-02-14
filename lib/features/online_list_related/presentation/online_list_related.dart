import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_add_to_playlist_builder/presentation/base_add_to_playlist.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_item_dropdown_actions/presentation/online_item_dropdown_actions.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:daily_mind/features/online_item_subtitle/presentation/online_item_subtitle.dart';
import 'package:daily_mind/features/online_item_title/presentation/online_item_title.dart';
import 'package:daily_mind/features/online_list_related_header/presentation/online_list_related_header.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineListRelated extends HookConsumerWidget {
  const OnlineListRelated({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configProvider);
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final onlinePlayer = baseBackgroundHandler.onlinePlayer;

    final sequenceSnapshot = useStream(onlinePlayer.sequenceStream);
    final sequence = sequenceSnapshot.data ?? [];

    final onTap = useCallback((int index) {
      baseBackgroundHandler.onlinePlayer.onSeekToIndex(index);
    }, [
      sequence,
    ]);

    final onGetSubtitle = useCallback((String name) {
      if (name.isNotEmpty) {
        return OnlineItemSubtitle(title: name);
      }
    }, []);

    return BaseSpacingContainerHorizontal(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: space(
          [
            const OnlineListRelatedHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: sequence.length,
                itemBuilder: (context, index) {
                  final s = sequence[index];
                  final audio = s.tag as Audio;
                  final artist = configState.onGetArtistById(audio.artist);
                  final name = artist?.name ?? kEmptyString;

                  return OnlineItem(
                    onTap: () => onTap(index),
                    image: audio.image,
                    title: OnlineItemTitle(title: audio.name),
                    subtitle: onGetSubtitle(name),
                    trailing: BaseAddToPlaylistBuilder(
                      audio: audio,
                      builder: (onOpenPlaylist) {
                        return OnlineItemDropdownActions(
                          audio: audio,
                          onOpenPlaylist: onOpenPlaylist,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
          height: spacing(3),
        ),
      ),
    );
  }
}
