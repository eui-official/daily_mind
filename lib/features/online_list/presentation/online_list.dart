import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/common_widgets/base_audios_builder/presentation/base_audios_builder_provider.dart';
import 'package:daily_mind/common_widgets/base_refresh/presentation/base_refresh.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/internet_connection_checker/presentation/internet_connection_checker.dart';
import 'package:daily_mind/features/online_explore_list/presentation/online_explore_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnlineList extends HookConsumerWidget {
  const OnlineList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudiosBuilderNotifier =
        ref.read(baseAudiosBuilderNotifierProvider.notifier);

    return InternetConnectionChecker(
      child: Scaffold(
        body: BaseRefresh(
          onRefresh: baseAudiosBuilderNotifier.onRefreshAudioCategories,
          child: Stack(
            children: [
              const BaseBackground(),
              AppBarScrollview(
                title: 'explore'.tr(),
                children: const [
                  OnlineExploreList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
