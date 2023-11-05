import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/item_category.dart';
import 'package:daily_mind/common_hooks/use_image_palette.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/common_widgets/base_online_handler/presentation/base_online_handler.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal_content.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal_image.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class OnlineCategoryHorizontal extends HookWidget {
  final ItemCategory itemCategory;

  const OnlineCategoryHorizontal({
    super.key,
    required this.itemCategory,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImageProvider(itemCategory.items.first.image);
    final paletteGenerator = useImagePallete(image);

    return BaseNullBuilder(
      value: paletteGenerator.data,
      builder: (palette) {
        final color = palette.darkMutedColor?.color.withOpacity(0.6) ??
            context.theme.colorScheme.background;

        return BaseOnlineHandler(
          itemCategory: itemCategory,
          builder: (onTap) {
            return SizedBox(
              height: spacing(15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(spacing(2)),
                child: BaseInkWell(
                  onTap: onTap,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: color,
                          boxShadow: kElevationToShadow[24],
                        ),
                        child: Row(
                          children: [
                            OnlineCategoryHorizontalImage(
                              imageUrl: itemCategory.items.first.image,
                            ),
                            Flexible(
                              child: OnlineCategoryHorizontalContent(
                                name: itemCategory.category.name,
                                description: itemCategory.category.description,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
