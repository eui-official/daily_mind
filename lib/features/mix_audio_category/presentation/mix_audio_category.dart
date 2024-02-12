import 'package:daily_mind/common_domains/offline_audio_category.dart';
import 'package:daily_mind/common_hooks/use_mix.dart';
import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items_header.dart';
import 'package:daily_mind/common_widgets/base_showcase/constant/showcase_keys.dart';
import 'package:daily_mind/common_widgets/base_showcase/presentation/base_showcase.dart';
import 'package:daily_mind/extensions/list.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/features/mix_audio_card/presentation/mix_audio_card.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class MixAudioCategory extends HookConsumerWidget {
  final OfflineAudioCategory offlineAudioCategory;
  final bool isFirstCategory;

  const MixAudioCategory({
    super.key,
    required this.offlineAudioCategory,
    required this.isFirstCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixNotifier = ref.read(mixProvider.notifier);
    final mixData = useMix(ref);

    return StickyHeader(
      header: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(bottom: spacing(3)),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
        ),
        child: Text(
          offlineAudioCategory.title,
          style: context.textTheme.titleMedium?.copyWith(
            color: context.theme.hintColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: BaseGridItemsHeader(
        items: offlineAudioCategory.offlineAudios,
        onItemIndexBuilder: (context, index, audio) {
          final isFirstOfflineAudio =
              audio == offlineAudioCategory.offlineAudios.first;
          final isSelected = mixData.mixItems.isContain(audio.id);

          if (isFirstOfflineAudio && isFirstCategory) {
            return BaseShowcase(
              showcaseKey: soundKey,
              description: 'newMixTutorialContent1'.tr(),
              child: MixAudioCard(
                isSelected: isSelected,
                audio: audio,
                onSelecting: mixNotifier.onSelect,
              ),
            );
          }

          return MixAudioCard(
            isSelected: isSelected,
            audio: audio,
            onSelecting: mixNotifier.onSelect,
          );
        },
      ),
    );
  }
}
