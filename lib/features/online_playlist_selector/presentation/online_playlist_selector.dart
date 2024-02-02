import 'package:daily_mind/common_applications/base_dialogs.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/features/online_playlist_available/presentation/online_playlist_available.dart';
import 'package:daily_mind/types/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistSelector extends HookWidget {
  final OnValueBuilder<int> onSelected;
  final ScrollController? scrollController;

  const OnlinePlaylistSelector({
    super.key,
    required this.onSelected,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final openAddOnlinePlaylist = useCallback(
      () async {
        final results = await context.onTextFieldDialog(
          'Tên playlist'.tr(),
        );

        if (results.isNotEmpty) {
          final result = results.first;

          onSafeValueBuilder(
            result,
            (title) {
              final newOnlinePlaylist = OnlinePlaylist()..title = title;
              db.onAddOnlinePlaylist(newOnlinePlaylist);
            },
          );
        }
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách playlist'.tr()),
      ),
      body: OnlinePlaylistAvailable(
        onSelected: (id) => onSelected(context, id),
        openAddOnlinePlaylist: openAddOnlinePlaylist,
        scrollController: scrollController,
      ),
    );
  }
}
