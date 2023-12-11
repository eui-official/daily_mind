import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MixCollectionButtonSwitcher extends StatelessWidget {
  final bool isCanAddNewMix;
  final VoidCallback onSaveMix;
  final VoidCallback onDeleteMix;

  const MixCollectionButtonSwitcher({
    super.key,
    required this.isCanAddNewMix,
    required this.onSaveMix,
    required this.onDeleteMix,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = isCanAddNewMix ? onSaveMix : onDeleteMix;
    final backgroundColor = isCanAddNewMix
        ? context.primaryColorDark50
        : context.theme.colorScheme.error;
    final title = isCanAddNewMix ? 'Bộ sưu tập' : 'Xóa';

    return BaseIconButtonWithTitle(
      onPressed: onPressed,
      iconData: Icons.video_collection_outlined,
      backgroundColor: backgroundColor,
      title: title.tr(),
    );
  }
}
