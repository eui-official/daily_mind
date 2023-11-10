import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_domains/category.dart';
import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_current_audio.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_information.dart';
import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerBottom extends HookConsumerWidget {
  final DailyMindBackgroundHandler backgroundHandler;
  final Category category;
  final Audio audio;

  const OnlinePlayerBottom({
    super.key,
    required this.backgroundHandler,
    required this.category,
    required this.audio,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: spacing(4),
        horizontal: spacing(2),
      ),
      decoration: const BoxDecoration(
        gradient: baseLinearGradient,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: space(
            [
              BasePlayerControl(
                backgroundHandler: backgroundHandler,
                onNext: backgroundHandler.skipToNext,
                onPrevious: backgroundHandler.skipToPrevious,
              ),
              const BaseTimerPicker(),
              BasePlayerInformation(category: category),
              BasePlayerCurrentAudio(audio: audio),
              const OnlineListRelated()
            ],
            height: spacing(4),
          ),
        ),
      ),
    );
  }
}
