import 'package:daily_mind/common_widgets/base_network_image.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class OnlineItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String image;
  final Widget title;

  const OnlineItem({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: onTap,
        leading: SizedBox(
          width: spacing(6),
          height: spacing(6),
          child: BaseNetworkImage(image: image),
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          height: spacing(6),
          child: title,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing()),
        ),
      ),
    );
  }
}
