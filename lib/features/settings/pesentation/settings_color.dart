import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_widgets/base_list_tile.dart';
import 'package:daily_mind/features/settings/pesentation/settings_theme_bottomsheet.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class SettingsColor extends StatelessWidget {
  const SettingsColor({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseListTile(
      title: 'color'.tr(),
      trailing: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: context.theme.primaryColor,
          borderRadius: circularRadius(),
        ),
      ),
      onTap: () {
        onShowBottomSheet(
          context,
          child: const SettingsThemeBottomSheet(),
        );
      },
    );
  }
}
