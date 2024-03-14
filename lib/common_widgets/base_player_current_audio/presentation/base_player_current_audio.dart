import 'package:daily_mind/common_domains/audio.dart';
import 'package:daily_mind/common_providers/config_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher/presentation/base_animated_switcher.dart';
import 'package:daily_mind/common_widgets/base_item_box_size.dart';
import 'package:daily_mind/common_widgets/base_player_current_audio/presentation/base_player_current_audio_title.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_item/presentation/online_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BasePlayerCurrentAudio extends HookConsumerWidget {
  final Audio audio;
  final bool isComplex;

  const BasePlayerCurrentAudio({
    super.key,
    required this.audio,
    this.isComplex = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configState = ref.watch(configNotifierProvider);

    final audioTitle = useMemoized(() {
      final artist = configState.onGetArtistById(audio.artist);
      final name = artist?.name ?? kEmptyString;

      final title = BasePlayerCurrentAudioTitle(
        title: audio.name,
        subtitle: name,
      );

      if (isComplex) {
        return OnlineItem(
          image: audio.image,
          title: title,
          size: 8,
        );
      }

      return BaseItemBoxSize(child: title);
    }, [
      audio,
      configState,
      isComplex,
    ]);

    return BaseAnimatedSwitcher(child: audioTitle);
  }
}
