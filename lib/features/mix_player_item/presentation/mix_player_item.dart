import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MixPlayerItem extends StatelessWidget {
  final MixItem item;

  const MixPlayerItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final player = item.player;
    final audio = item.audio;

    return BaseMixEditorItem(
      image: audio.image,
      initVolume: player.volume,
      name: audio.name.tr(),
      onVolumeChanged: player.setVolume,
    );
  }
}
