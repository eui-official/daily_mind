import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistSwitcher extends HookWidget {
  final VoidCallback onOpenPlaylist;

  const OnlinePlaylistSwitcher({
    super.key,
    required this.onOpenPlaylist,
  });

  @override
  Widget build(BuildContext context) {
    return BaseIconButtonWithTitle(
      onPressed: onOpenPlaylist,
      iconData: Icons.playlist_add_outlined,
      title: 'Lưu vào playlist'.tr(),
    );
  }
}
