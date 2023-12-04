import 'package:daily_mind/common_widgets/base_list_view_header.dart';
import 'package:daily_mind/common_widgets/base_sliver_list.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/settings/constants/supported_theme.dart';
import 'package:daily_mind/features/settings/pesentation/settings_theme_color_box.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsThemeBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  const SettingsThemeBottomSheet({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListViewHeader(
      title: 'colorList'.tr(),
      child: Expanded(
        child: BaseSliverList(
          scrollController: scrollController,
          children: supportedThemes.map((theme) {
            return ListTile(
              onTap: () {
                db.onAddSetting(theme.id, "theme");
                context.pop();
              },
              leading: SettingsThemeColorBox(scheme: theme.scheme),
              title: Text(theme.title),
            );
          }).toList(),
        ),
      ),
    );
  }
}
