import 'package:daily_mind/common_widgets/base_list_sound.dart';
import 'package:daily_mind/constants/sound_items.dart';
import 'package:daily_mind/features/sound_card_offline/presentation/sound_card_offline.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ListSoundOffline extends StatelessWidget {
  const ListSoundOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseListSound(
      title: 'naturalSounds'.tr(),
      items: soundOfflineItems,
      onSoundBuilder: (context, index, item) {
        return SoundCardOffline(
          backgroundKey: index == 0 ? soundKey : ValueKey(item.id),
          item: item,
        );
      },
    );
  }
}
