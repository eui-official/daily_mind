import 'package:daily_mind/common_applications/in_app_review.dart';
import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/settings/pesentation/settings_theme.dart';
import 'package:daily_mind/features/settings/pesentation/settings_version.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BaseBackground(),
          AppBarScrollview(
            title: 'settings'.tr(),
            children: [
              Column(
                children: [
                  const SettingsTheme(),
                  ListTile(
                    onTap: () {
                      inAppReview.openStoreListing(appStoreId: appStoreId);
                    },
                    title: Text('rating'.tr()),
                  ),
                  const SettingsVersion(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
