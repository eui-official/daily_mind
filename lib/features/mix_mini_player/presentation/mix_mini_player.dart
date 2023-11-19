import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_hooks/use_mix.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/features/mix_mini_player/presentation/mix_mini_player_images.dart';
import 'package:daily_mind/features/mix_player/presentation/mix_player.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixMiniPlayer extends HookConsumerWidget {
  const MixMiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixNotifier = ref.read(mixProvider.notifier);
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final mixData = useMix(ref);

    final title = mixData.mixItems.map((item) {
      final audio = item.audio;

      return audio.name.tr();
    }).join(', ');

    final onOpenMiniPlayer = useCallback(
      () async {
        await onShowBottomSheet(
          context,
          child: const MixPlayer(),
        );

        mixNotifier.onClearTitle();
      },
      [context],
    );

    return BaseMiniPlayer(
      onTap: onOpenMiniPlayer,
      title: mixData.mediaItem?.title ?? title,
      subtitle: '${mixData.mixItems.length} âm thanh'.tr(),
      leading: const MixMiniPlayerImages(),
      isLoading: false,
      isPlaying: mixData.isPlaying,
      onPause: baseBackgroundHandler.pause,
      onPlay: baseBackgroundHandler.play,
    );
  }
}
