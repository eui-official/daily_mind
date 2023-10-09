import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/online_stories_list/presentation/online_stories_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OnlineList extends StatelessWidget {
  const OnlineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarScrollview(
        title: 'stories'.tr(),
        children: const [
          OnlineStoriesList(),
        ],
      ),
    );
  }
}
