import 'package:daily_mind/common_applications/in_app_review.dart';
import 'package:daily_mind/common_widgets/base_container_list/presentation/base_container_list.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/settings/pesentation/settings_color.dart';
import 'package:daily_mind/features/settings/pesentation/settings_playlist.dart';
import 'package:daily_mind/features/settings/pesentation/settings_version.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarScrollview(
      title: 'settings'.tr(),
      children: space(
        [
          BaseContainerList(
            title: 'Thư viện'.tr(),
            items: const [
              SettingsPlaylist(),
            ],
          ),
          BaseContainerList(
            title: 'styling'.tr(),
            items: const [
              SettingsColor(),
            ],
          ),
          BaseContainerList(
            title: 'feedback'.tr(),
            items: [
              BaseTile(
                onTap: () {
                  inAppReview.openStoreListing(appStoreId: kAppStoreId);
                },
                title: 'rating'.tr(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(spacing(2)),
                  topRight: Radius.circular(spacing(2)),
                ),
              ),
              BaseTile(
                onTap: () {
                  launchUrl(Uri.parse('https://m.me/eui.dailymind'));
                },
                title: 'sendFeedback'.tr(),
                subtitle: Text(
                  'sendFeedbackDescription'.tr(),
                  style: const TextStyle(color: secondaryTextColor),
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(spacing(2)),
                  bottomRight: Radius.circular(spacing(2)),
                ),
              ),
            ],
          ),
          BaseContainerList(
            title: 'system'.tr(),
            items: const [
              SettingsVersion(),
            ],
          ),
        ],
        height: spacing(3),
      ),
    );
  }
}
