import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/adaptive_dialog_validators.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_list_tile.dart';
import 'package:daily_mind/common_widgets/base_square_icon.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/features/online_playlist_available/presentation/online_playlist_available.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistList extends HookWidget {
  final ValueChanged<int> onSelected;

  const OnlinePlaylistList({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final openAddOnlinePlaylist = useCallback(
      () async {
        final results = await showTextInputDialog(
          context: context,
          textFields: [
            DialogTextField(
              hintText: 'Tên playlist'.tr(),
              validator: adaptiveDialogValidators.required,
            ),
          ],
        );

        if (results?.isNotEmpty ?? false) {
          final result = results?.first;

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
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(vertical: kToolbarHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: spacing(2)),
          child: BaseContentHeader(
            title: 'Danh sách playlist',
            child: Flexible(
              child: Column(
                children: space(
                  [
                    BaseListTile(
                      onTap: openAddOnlinePlaylist,
                      leading: const BaseSquareIcon(iconData: Icons.add),
                      title: 'Thêm mới',
                    ),
                    Flexible(
                      child: OnlinePlaylistAvailable(onSelected: onSelected),
                    ),
                  ],
                  height: spacing(5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
