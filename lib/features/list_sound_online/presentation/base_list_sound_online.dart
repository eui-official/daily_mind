import 'package:collection/collection.dart';
import 'package:daily_mind/common_domains/sound_online_item.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_list_sound.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/list_sound_online/domain/sound_online_bundle.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/sound_card_online/presentation/sound_card_online.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseListSoundOnline extends HookConsumerWidget {
  final List<SoundOnlineItem> items;
  final String title;
  final Widget headerTrailing;

  const BaseListSoundOnline({
    super.key,
    required this.items,
    required this.title,
    this.headerTrailing = emptyWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configProvider);
    final newMixSelectedNotifier = ref.read(newMixProvider.notifier);
    final newMixSelectedState = ref.watch(newMixProvider);

    final soundBundles = useMemoized(() {
      List<SoundOnlineBundle> bundles = [];
      final groupBySoundTypes =
          items.groupListsBy((element) => element.soundType);

      groupBySoundTypes.forEach((soundTypeId, sounds) {
        final soundType = configState.soundTypes
            .firstWhere((element) => element.id == soundTypeId);

        bundles.add(
          SoundOnlineBundle(soundType: soundType, sounds: sounds),
        );
      });

      return bundles;
    }, [items, configState]);

    return BaseListSound(
      items: soundBundles,
      title: title,
      onSoundBuilder: (context, index, bundle) {
        final isSelected = newMixSelectedState.isContain(bundle.soundType.id);

        return SoundCardOnline(
          backgroundKey: index == 0 ? soundKey : ValueKey(bundle.soundType.id),
          isSelected: isSelected,
          onDeleted: newMixSelectedNotifier.onDeleted,
          onSelecting: newMixSelectedNotifier.onSelecting,
          selectingId:
              newMixSelectedState.selectingState.sound?.id ?? emptyString,
          bundle: bundle,
        );
      },
    );
  }
}
