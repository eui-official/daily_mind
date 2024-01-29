import 'package:daily_mind/common_widgets/base_icon/presentation/dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlaylistDetailsAction extends StatelessWidget {
  const PlaylistDetailsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          onTap: () {},
          child: Text('Đổi tên'.tr()),
        ),
        PopupMenuItem(
          onTap: () {},
          child: Text('Xóa playlist'.tr()),
        )
      ],
      child: const DropdownIcon(),
    );
  }
}
