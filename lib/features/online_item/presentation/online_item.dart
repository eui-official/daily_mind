import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class OnlineItem extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final String name;

  const OnlineItem({
    super.key,
    required this.onTap,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: spacing(6),
        height: spacing(6),
        child: BaseNetworkImage(image: image),
      ),
      title: Text(
        name,
        style: context.textTheme.bodyMedium,
      ),
    );
  }
}
