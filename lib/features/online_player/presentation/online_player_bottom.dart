import 'package:daily_mind/common_applications/base_audio_handler.dart';
import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_current_item.dart';
import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerBottom extends HookConsumerWidget {
  final DailyMindAudioHandler audioHandler;
  final Item item;

  const OnlinePlayerBottom({
    super.key,
    required this.audioHandler,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.only(bottom: spacing(4)),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black38,
            Colors.black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BasePlayerControl(
              audioHandler: audioHandler,
              onNext: audioHandler.onNextOnline,
              onPrevious: audioHandler.onPreviousOnline,
            ),
            BaseTimerPicker(
              padding: EdgeInsets.all(spacing(2)),
            ),
            BasePlayerCurrentItem(item: item),
            const OnlineListRelated()
          ],
        ),
      ),
    );
  }
}
