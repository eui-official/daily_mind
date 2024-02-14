import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/extensions/base_dialogs.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_mini_player/domain/mini_player_state.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_provider.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/enums.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/mix_collection_item_edit_bottom_sheet/presentation/mix_collection_item_edit_bottom_sheet.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart' hide Trans;
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollectionItem extends HookConsumerWidget {
  final MixCollection mixCollection;

  const MixCollectionItem({
    super.key,
    required this.mixCollection,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final baseMiniPlayerNotifier = ref.watch(baseMiniPlayerProvider.notifier);

    final items = mixCollection.items ?? [];
    final firstItem = items.first;
    final firstAudioOffline = firstItem.id.onGetOfflineAudio;
    final sounds =
        items.map((item) => item.id.onGetOfflineAudio.title.tr()).join(', ');

    final onRenamed = useCallback(() async {
      context.pop();

      final results = await context.onTextFieldDialog(
        'Tiêu đề bản phối'.tr(),
        mixCollection.title,
      );

      if (results.isNotEmpty) {
        final result = results.first;

        onSafeValueBuilder(result, (title) {
          baseBackgroundHandler.onUpdateMixCollectionTitle(
            title,
            mixCollection.id,
          );
        });
      }
    }, [mixCollection]);

    final onDeleted = useCallback(
      () async {
        context.pop();

        final result = await showOkCancelAlertDialog(
          context: context,
          message:
              'Bạn có chắc chắn muốn xóa bản phối ${mixCollection.title}?'.tr(),
        );

        if (result == OkCancelResult.ok) {
          db.onDeleteCollection(mixCollection.id);
        }
      },
      [context, mixCollection],
    );

    final onOpenEdit = useCallback(() async {
      onShowScrollableBottomSheet(
        context,
        builder: (context, scrollController) =>
            MixCollectionItemEditBottomSheet(
          mixCollection: mixCollection,
          onDeleted: onDeleted,
          onRenamed: onRenamed,
        ),
      );
    }, [context, mixCollection]);

    return Stack(
      children: [
        BaseCard(
          onTap: () {
            baseBackgroundHandler.onInitMix(mixCollection);
            baseMiniPlayerNotifier.onUpdateState(
              const MiniPlayerState(
                isShow: true,
                audioType: AudioTypes.mix,
              ),
            );
          },
          content: BaseSpacingContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mixCollection.title ?? kEmptyString,
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
        ),
        Container(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: onOpenEdit,
            icon: const Icon(Icons.more_vert),
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
