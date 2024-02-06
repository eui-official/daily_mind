import 'package:daily_mind/common_domains/audio_category.dart';
import 'package:daily_mind/common_widgets/base_null_builder.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/constants/audio_card_sizes.dart';
import 'package:daily_mind/features/online_category_vertical/presentation/online_category_vertical.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class OnlineCategoryGroup extends HookWidget {
  final List<AudioCategory> audioCategories;

  const OnlineCategoryGroup({
    super.key,
    required this.audioCategories,
  });

  @override
  Widget build(BuildContext context) {
    final group = useMemoized(
      () => audioCategories.first.group,
      [audioCategories],
    );

    final items = useMemoized(() {
      return audioCategories.map(
        (audioCategory) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return OnlineCategoryVertical(
                audioCategory: audioCategory,
              );
            },
          );
        },
      ).toList();
    }, [audioCategories]);

    return BaseSpacingContainerHorizontal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: space(
          [
            BaseNullBuilder(
              value: group,
              builder: (safeGroup) {
                return Text(
                  safeGroup.name,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            SizedBox(
              height: kSmallCard,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: space(
                  items,
                  width: spacing(2),
                ),
              ),
            ),
          ],
          height: spacing(2),
        ),
      ),
    );
  }
}
