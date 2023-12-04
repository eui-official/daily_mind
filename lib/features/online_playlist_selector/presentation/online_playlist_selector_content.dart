import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/adaptive_dialog_validators.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_widgets/base_divider.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/common_widgets/base_square_icon.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/db/schemas/online_playlist.dart';
import 'package:daily_mind/features/online_playlist_available/presentation/online_playlist_available.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnlinePlaylistSelectorContent extends HookWidget {
  final ValueChanged<int> onSelected;

  const OnlinePlaylistSelectorContent({
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

    return Column(
      children: space(
        [
          BaseSpacingContainer(
            child: BaseTile(
              onTap: openAddOnlinePlaylist,
              leading: const BaseSquareIcon(iconData: Icons.add),
              title: 'Thêm mới',
            ),
          ),
          const BaseDivider(),
          BaseSpacingContainer(
            child: OnlinePlaylistAvailable(onSelected: onSelected),
          )
        ],
        height: spacing(2),
      ),
    );
  }
}
