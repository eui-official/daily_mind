import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_current_audio.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_information.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/features/online_mini_player/presentation/online_mini_player_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerBottom extends HookConsumerWidget {
  final DailyMindBackgroundHandler backgroundHandler;
  final Audio audio;

  const OnlinePlayerBottom({
    super.key,
    required this.audio,
    required this.backgroundHandler,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onlineMiniPlayerState = ref.watch(onlineMiniPlayerNotifierProvider);
    final category = onlineMiniPlayerState.category;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: spacing(4),
        horizontal: spacing(2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: space(
          [
            BasePlayerControl(
              backgroundHandler: backgroundHandler,
              onNext: backgroundHandler.skipToNext,
              onPrevious: backgroundHandler.skipToPrevious,
            ),
            BasePlayerInformation(category: category),
            BasePlayerCurrentAudio(audio: audio),
            const OnlineListRelated()
          ],
          height: spacing(4),
        ),
      ),
    );
  }
}
