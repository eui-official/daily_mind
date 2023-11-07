import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal.dart';
import 'package:daily_mind/features/online_category_vertical/presentation/online_category_vertical.dart';
import 'package:flutter/material.dart';

class OnlineCategoryWithoutGroup extends StatelessWidget {
  final List<AudioCategory> audioCategories;

  const OnlineCategoryWithoutGroup({
    super.key,
    required this.audioCategories,
  });

  @override
  Widget build(BuildContext context) {
    return BaseGridItems(
      items: audioCategories,
      onItemIndexBuilder: (context, index, audioCategory) {
        if (audioCategory.category.layout == 'vertical') {
          return OnlineCategoryVertical(audioCategory: audioCategory);
        }

        return OnlineCategoryHorizontal(audioCategory: audioCategory);
      },
    );
  }
}
