import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart' hide Trans;

class OnlinePlaylistSwitcher extends HookWidget {
  const OnlinePlaylistSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseIconButtonWithTitle(
      onPressed: () {},
      icon: const Icon(Icons.playlist_add_outlined),
      style:
          IconButton.styleFrom(backgroundColor: context.theme.primaryColorDark),
      title: 'Lưu vào playlist'.tr(),
    );
  }
}
