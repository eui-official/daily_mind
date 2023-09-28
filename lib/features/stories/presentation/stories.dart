import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/stories_list/presentation/stories_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarScrollview(
        title: 'stories'.tr(),
        children: const [
          StoriesList(),
        ],
      ),
    );
  }
}
