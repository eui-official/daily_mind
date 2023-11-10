import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/audio_card_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class BaseEmptyListBox extends StatelessWidget {
  final String imageUrl;
  final String subTitle;
  final String title;
  final Widget action;

  const BaseEmptyListBox({
    super.key,
    required this.action,
    required this.imageUrl,
    required this.title,
    this.subTitle = emptyString,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      image: AssetImage(imageUrl),
      imageHeight: smallCard,
      content: BaseSpacingContainer(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subTitle.isNotEmpty)
                  Text(
                    subTitle,
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ],
            ),
            Flexible(child: action),
          ],
        ),
      ),
    );
  }
}
