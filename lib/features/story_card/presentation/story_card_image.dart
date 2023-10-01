import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class StoryCardImage extends StatelessWidget {
  final String image;

  const StoryCardImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: spacing()),
      child: BaseNetworkImage(
        image: image,
        size: 6,
      ),
    );
  }
}
