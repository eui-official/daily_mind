import 'package:daily_mind/common_widgets/base_background_gradient.dart';
import 'package:daily_mind/features/list_sounds/constant/sound_items.dart';
import 'package:daily_mind/features/mix_editor_item/presentation/mix_editor_content.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class MixEditorItem extends StatelessWidget {
  final String id;

  const MixEditorItem({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final soundItem = soundItems.firstWhere((item) => item.id == id);

    return SizedBox(
      height: spacing(15),
      width: context.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(spacing(2)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(soundItem.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const BaseBackgroundGradient(),
            Positioned(
              bottom: spacing(2),
              left: 0,
              right: 0,
              child: MixEditorContent(name: soundItem.name),
            ),
          ],
        ),
      ),
    );
  }
}
