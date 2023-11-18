import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class MixMiniPlayerImagesSlider extends StatelessWidget {
  final List<MixItem> mixItems;

  const MixMiniPlayerImagesSlider({
    super.key,
    required this.mixItems,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: mixItems.length,
      itemBuilder: (context, index, realIndex) {
        final item = mixItems[index];
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
        autoPlay: mixItems.length > 1,
        aspectRatio: 1,
        viewportFraction: 1,
        autoPlayAnimationDuration: shorterDuration,
      ),
    );
  }
}
