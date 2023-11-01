import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_container.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/common_widgets/base_mix_editor_content.dart';
import 'package:daily_mind/features/volume_slider/presentation/volume_slider.dart';
import 'package:flutter/material.dart';

class BaseMixEditorItem extends StatelessWidget {
  final String image;
  final String name;
  final double initVolume;
  final ValueChanged<double> onVolumeChanged;
  final Widget prefixChild;
  final Key? volumeKey;

  const BaseMixEditorItem({
    super.key,
    required this.image,
    required this.name,
    required this.initVolume,
    required this.onVolumeChanged,
    this.prefixChild = emptyWidget,
    this.volumeKey,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      image: AssetImage(image),
      content: BaseContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                prefixChild,
                BaseMixEditorContent(name: name),
              ],
            ),
            VolumeSlider(
              key: volumeKey,
              onVolumeChanged: onVolumeChanged,
              initVolume: initVolume,
            )
          ],
        ),
      ),
    );
  }
}
