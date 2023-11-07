import 'package:daily_mind/common_widgets/base_grid_items/presentation/base_grid_items.dart';
import 'package:daily_mind/common_widgets/base_audios_builder/presentation/base_audios_builder.dart';
import 'package:daily_mind/features/online_category/presentation/online_category.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal.dart';
import 'package:flutter/material.dart';

class OnlineExploreList extends StatelessWidget {
  const OnlineExploreList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseAudiosBuilder(
      onAudiosBuilder: (context, audioCategories) {
        return BaseGridItems(
          items: audioCategories,
          onItemBuilder: (context, index, audioCategory) {
            if (audioCategory.category.layout == 'vertical') {
              return OnlineCategory(audioCategory: audioCategory);
            }

            return OnlineCategoryHorizontal(audioCategory: audioCategory);
          },
        );
      },
    );
  }
}
