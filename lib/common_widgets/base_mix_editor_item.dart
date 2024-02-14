import 'package:daily_mind/common_widgets/base_card/presentation/base_card_image.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/volume_slider/presentation/volume_slider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class BaseMixEditorItem extends StatelessWidget {
  final double initVolume;
  final Key? volumeKey;
  final String image;
  final String name;
  final ValueChanged<double> onVolumeChanged;
  final Widget prefixChild;
  final VoidCallback onDeleted;

  const BaseMixEditorItem({
    super.key,
    required this.image,
    required this.initVolume,
    required this.name,
    required this.onVolumeChanged,
    required this.onDeleted,
    this.prefixChild = kEmptyWidget,
    this.volumeKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: space(
        [
          badges.Badge(
            position: badges.BadgePosition.topStart(),
            badgeContent: Icon(
              Icons.close,
              size: spacing(1.5),
            ),
            badgeStyle: badges.BadgeStyle(
              badgeColor: context.theme.primaryColorDark,
            ),
            onTap: onDeleted,
            child: BaseCardImage(
              height: spacing(7),
              width: spacing(7),
              image: AssetImage(image),
            ),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: space(
                [
                  Text(
                    name,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  VolumeSlider(
                    initVolume: initVolume,
                    onVolumeChanged: onVolumeChanged,
                  ),
                ],
                height: spacing(2),
              ),
            ),
          )
        ],
        width: spacing(2),
      ),
    );
  }
}
