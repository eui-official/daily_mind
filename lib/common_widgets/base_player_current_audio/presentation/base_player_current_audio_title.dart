import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:collection/collection.dart';
import 'package:daily_mind/common_widgets/base_marquee.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/online_item_subtitle/presentation/online_item_subtitle.dart';
import 'package:flutter/material.dart';

class BasePlayerCurrentAudioTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const BasePlayerCurrentAudioTitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: BaseMarquee(
            text: title,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle.isNotEmpty
            ? OnlineItemSubtitle(
                title: subtitle,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.theme.hintColor,
                ),
              )
            : kNull,
      ].whereNotNull().toList(),
    );
  }
}
