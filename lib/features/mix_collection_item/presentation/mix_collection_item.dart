import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollectionItem extends HookConsumerWidget {
  final Playlist playlist;

  const MixCollectionItem({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = playlist.items ?? [];
    final firstItem = items.first;
    final firstAudioOffline = firstItem.id.onGetOfflineAudio;
    final sounds =
        items.map((item) => item.id.onGetOfflineAudio.name.tr()).join(', ');

    return BaseCard(
      content: BaseSpacingContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              playlist.title ?? emptyString,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              sounds,
              style: context.textTheme.bodySmall?.copyWith(
                color: secondaryTextColor,
              ),
            )
          ],
        ),
      ),
      image: AssetImage(firstAudioOffline.image),
    );
  }
}
