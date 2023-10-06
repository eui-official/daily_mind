import 'package:daily_mind/common_domains/item.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_player_control/presentation/base_player_control.dart';
import 'package:daily_mind/features/online_list_related/presentation/online_list_related.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlinePlayerBottom extends HookConsumerWidget {
  final List<Item> fullItems;

  const OnlinePlayerBottom({
    super.key,
    required this.fullItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandlerNotifier =
        ref.read(baseAudioHandlerProvider.notifier);

    return Container(
      padding: EdgeInsets.only(bottom: spacing(4)),
      color: context.theme.colorScheme.background.withOpacity(0.9),
      child: SafeArea(
        child: Column(
          children: [
            BasePlayerControl(
              audioHandler: baseAudioHandlerNotifier.audioHandler,
            ),
            OnlineListRelated(
              fullItems: fullItems,
            )
          ],
        ),
      ),
    );
  }
}
