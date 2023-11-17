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
    final mixState = ref.watch(mixProvider);

    return CarouselSlider.builder(
      itemCount: mixState.mixItems.length,
      itemBuilder: (context, index, realIndex) {
        final item = mixState.mixItems[index];
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
        autoPlay: mixState.mixItems.length > 1,
        aspectRatio: 1,
        viewportFraction: 1,
        autoPlayAnimationDuration: shorterDuration,
      ),
    );
  }
}
