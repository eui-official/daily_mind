import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_image.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_list_audio.dart';
import 'package:daily_mind/features/playlist_details/presentation/playlist_details_play_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlaylistDetailsContent extends HookConsumerWidget {
  final String title;
  final List<Audio> audios;

  const PlaylistDetailsContent({
    super.key,
    required this.title,
    required this.audios,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);

    final child = useMemoized(
      () {
        if (audios.isEmpty) {
          return kEmptyWidget;
        }

        return Stack(
          children: [
            AppBarScrollview(
              title: title,
              flexibleSpace: FlexibleSpaceBar(
                background: PlaylistDetailsImage(audio: audios.first),
              ),
              expandedHeight: context.height / 3,
              children: [
                PlaylistDetailsListAudio(audios: audios),
              ],
            ),
            PlaylistDetailsPlayIconButton(
              onPlay: () async {
                await baseBackgroundHandler.onInitOnline(audios);

                baseMiniPlayerNotifier.onUpdateState(
                  const MiniPlayerState(
                    isShow: true,
                    audioType: AudioTypes.online,
                  ),
                );
              },
            )
          ],
        );
      },
      [audios],
    );

    return BaseAnimatedSwitcher(child: child);
  }
}
