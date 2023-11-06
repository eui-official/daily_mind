import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class BaseEmptyListBox extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Widget action;

  const BaseEmptyListBox({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      image: AssetImage(imageUrl),
      imageHeight: smallCard,
      content: BaseSpacingContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Flexible(child: action),
          ],
        ),
      ),
    );
  }
}
