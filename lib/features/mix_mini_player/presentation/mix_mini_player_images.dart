import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_animated_switcher.dart';
import 'package:daily_mind/features/mix_mini_player/presentation/mix_mini_player_empty_image.dart';
import 'package:daily_mind/features/mix_mini_player/presentation/mix_mini_player_images_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixMiniPlayerImages extends HookConsumerWidget {
  const MixMiniPlayerImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final mixItemsSnapshot = useStream(baseBackgroundHandler.onStreamMixItems);
    final mixItems = mixItemsSnapshot.data ?? [];

    final child = useMemoized(() {
      if (mixItems.isEmpty) {
        return const MixMiniPlayerEmptyImage();
      }

      return MixMiniPlayerImagesSlider(mixItems: mixItems);
    }, [mixItems]);

    return BaseAnimatedSwitcher(child: child);
  }
}
