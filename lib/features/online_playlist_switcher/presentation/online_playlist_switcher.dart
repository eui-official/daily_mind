import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:daily_mind/features/online_playlist_selector/presentation/online_playlist_selector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistSwitcher extends HookWidget {
  final ValueChanged<int> onSelected;

  const OnlinePlaylistSwitcher({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final onOpenPlaylist = useCallback(() {
      onShowScrollableBottomSheet(
        context,
        useSafeArea: true,
        initialChildSize: 1,
        builder: (context, scrollController) => OnlinePlaylistSelector(
          scrollController: scrollController,
          onSelected: onSelected,
        ),
      );
    }, []);

    return BaseIconButtonWithTitle(
      onPressed: onOpenPlaylist,
      icon: const Icon(Icons.playlist_add_outlined),
      title: 'Lưu vào playlist'.tr(),
    );
  }
}
