import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_hooks/use_image_palette.dart';
import 'package:daily_mind/common_widgets/base_inkwell/presentation/base_inkwell.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/common_widgets/base_online_handler/presentation/base_online_handler.dart';
import 'package:daily_mind/constants/audio_card.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal_content.dart';
import 'package:daily_mind/features/online_category_horizontal/presentation/online_category_horizontal_image.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';

class OnlineCategoryHorizontal extends HookWidget {
  final AudioCategory audioCategory;

  const OnlineCategoryHorizontal({
    super.key,
    required this.audioCategory,
  });

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImageProvider(audioCategory.audios.first.image);
    final paletteGenerator = useImagePallete(image);

    return BaseNullBuilder(
      value: paletteGenerator.data,
      builder: (palette) {
        final color = palette.dominantColor?.color.withOpacity(0.6) ??
            context.theme.colorScheme.background;

        return BaseOnlineHandler(
          audioCategory: audioCategory,
          builder: (onTap) {
            return SizedBox(
              height: tinyCard,
              child: ClipRRect(
                borderRadius: circularRadius(2),
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
                              imageUrl: audioCategory.audios.first.image,
                            ),
                            Flexible(
                              child: OnlineCategoryHorizontalContent(
                                name: audioCategory.category.name,
                                description: audioCategory.category.description,
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
