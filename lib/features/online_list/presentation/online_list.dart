import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/common_widgets/base_internet_check/presentation/base_internet_check.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/internet_watcher/presentation/internet_watcher.dart';
import 'package:daily_mind/features/online_stories_list/presentation/online_stories_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnlineList extends StatelessWidget {
  const OnlineList({super.key});

  @override
  Widget build(BuildContext context) {
    return InternetWatcher(
      child: Scaffold(
        body: Stack(
          children: [
            const BaseBackground(),
            BaseInternetCheck(
              child: AppBarScrollview(
                title: 'stories'.tr(),
                children: const [
                  OnlineStoriesList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
