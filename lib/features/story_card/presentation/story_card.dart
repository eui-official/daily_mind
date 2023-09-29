import 'package:cached_network_image/cached_network_image.dart';
import 'package:daily_mind/common_domains/story.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: SizedBox(
        width: spacing(8),
        height: spacing(6),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(spacing()),
          child: CachedNetworkImage(
            imageUrl: story.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        story.name,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
