import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixMiniPlayerImages extends HookConsumerWidget {
  const MixMiniPlayerImages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixNotifier = ref.watch(mixProvider.notifier);

    return CarouselSlider.builder(
      itemCount: mixNotifier.mixItems.length,
      itemBuilder: (context, index, realIndex) {
        final item = mixNotifier.mixItems[index];
        final audio = item.audio;

        return Container(
          width: spacing(5),
          height: spacing(5),
          margin: EdgeInsets.all(spacing()),
          decoration: BoxDecoration(
            borderRadius: circularRadius(),
            image: DecorationImage(
              image: AssetImage(audio.image),
            ),
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: mixNotifier.mixItems.length > 1,
        aspectRatio: 1,
        viewportFraction: 1,
        autoPlayAnimationDuration: shorterDuration,
      ),
    );
  }
}
