import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/mix_collections/presentation/mix_conllections_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollections extends HookConsumerWidget {
  const MixCollections({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgronudHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.read(baseMiniPlayerProvider.notifier);
    final mixCollectionsState = ref.watch(mixCollectionsNotifierProvider);

    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: mixCollectionsState.length,
      itemBuilder: (context, index) {
        final playlist = mixCollectionsState[index];
        final items = playlist.items ?? [];

        return ListTile(
          onTap: () {
            baseBackgronudHandler.onInitMix(playlist);
            baseMiniPlayerNotifier.onUpdateState(
                const MiniPlayerState(isShow: true, audioType: AudioTypes.mix));
          },
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: spacing(5),
            height: spacing(5),
            decoration: BoxDecoration(
              borderRadius: circularRadius(),
              image: DecorationImage(
                image: AssetImage(items.first.id.onGetOfflineAudio.image),
              ),
            ),
          ),
          title: Text(
            playlist.title ?? emptyString,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            '${items.length} âm thanh'.tr(),
            style: context.textTheme.bodySmall?.copyWith(
              color: secondaryTextColor,
            ),
          ),
        );
      },
    );
  }
}
