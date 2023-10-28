import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/common_widgets/base_mix_editor_content.dart';
import 'package:daily_mind/features/volume_slider/presentation/volume_slider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    return SizedBox(
      height: spacing(20),
      width: context.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing(2)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BaseBackgroundGradient(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: spacing(2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: spacing(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        prefixChild,
                        BaseMixEditorContent(name: name),
                      ],
                    ),
                  ),
                  VolumeSlider(
                    key: volumeKey,
                    onVolumeChanged: onVolumeChanged,
                    initVolume: initVolume,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
