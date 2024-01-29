import 'package:daily_mind/common_widgets/base_icon/presentation/dropdown.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlaylistDetailsAction extends StatelessWidget {
  final VoidCallback onEditName;
  final VoidCallback onDeletePlaylist;

  const PlaylistDetailsAction({
    super.key,
    required this.onEditName,
    required this.onDeletePlaylist,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          onTap: onEditName,
          child: Text('Đổi tên'.tr()),
        ),
        PopupMenuItem(
          onTap: onDeletePlaylist,
          child: Text('Xóa playlist'.tr()),
        )
      ],
      child: const DropdownIcon(),
    );
  }
}
