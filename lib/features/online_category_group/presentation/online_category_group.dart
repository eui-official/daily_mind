import 'package:carousel_slider/carousel_slider.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/constants/carousel.dart';
import 'package:daily_mind/features/online_category_vertical/presentation/online_category_vertical.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineCategoryGroup extends StatelessWidget {
  final List<AudioCategory> audioCategories;

  const OnlineCategoryGroup({
    super.key,
    required this.audioCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: spacing(2)),
      child: CarouselSlider.builder(
        itemCount: audioCategories.length,
        itemBuilder: (context, index, realIndex) {
          final audioCategory = audioCategories[index];

          return LayoutBuilder(
            builder: (context, constraints) {
              return OnlineCategoryVertical(
                audioCategory: audioCategory,
                imageHeight: constraints.maxHeight,
                padding: EdgeInsets.zero,
              );
            },
          );
        },
        options: baseCarouselOptions,
      ),
    );
  }
}
