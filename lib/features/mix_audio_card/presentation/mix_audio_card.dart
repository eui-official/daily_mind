import 'package:daily_mind/common_applications/gapless_audio_player.dart';
import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/common_widgets/base_audio_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixAudioCard extends HookConsumerWidget {
  final bool isSelected;
  final OfflineAudio audio;
  final ValueChanged<OfflineAudio> onSelecting;
  final player = GaplessAudioPlayer();

  MixAudioCard({
    super.key,
    required this.isSelected,
    required this.audio,
    required this.onSelecting,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onTap = useCallback(() {
      onSelecting(audio);
    }, [audio]);

    return BaseAudioCard(
      image: AssetImage(audio.image),
      isSelected: isSelected,
      name: audio.title.tr(),
      onTap: onTap,
    );
  }
}
