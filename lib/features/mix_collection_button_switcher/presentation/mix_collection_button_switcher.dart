import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

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
        ? context.theme.primaryColorDark
        : context.theme.colorScheme.error;
    final title = isCanAddNewMix ? 'Lưu vào bộ sưu tập' : 'Xóa khỏi bộ sưu tập';

    return BaseIconButtonWithTitle(
      onPressed: onPressed,
      icon: const Icon(Icons.favorite_outline),
      style: IconButton.styleFrom(backgroundColor: backgroundColor),
      title: title.tr(),
    );
  }
}
