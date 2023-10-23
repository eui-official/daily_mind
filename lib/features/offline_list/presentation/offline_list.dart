import 'package:daily_mind/common_widgets/base_background.dart';
import 'package:daily_mind/features/add_new_mix_button/presentation/add_new_mix_button.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/empty_list_mix/presentation/empty_list_mix.dart';
import 'package:daily_mind/features/offline_list_chord/presentation/offline_list_chord.dart';
import 'package:daily_mind/features/offline_list_chord/presentation/offline_list_chore_provider.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineList extends HookConsumerWidget {
  const OfflineList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offlineListChoreState = ref.watch(offlineListChoreProvider);

    if (offlineListChoreState.isEmptyPlaylists) {
      return const EmptyListMix();
    }

    return Scaffold(
      body: Stack(
        children: [
          const BaseBackground(),
          AppBarScrollview(
            title: 'naturalSounds'.tr(),
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: spacing(2)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'mixList'.tr(),
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const AddNewMixButton(),
                      ],
                    ),
                    const OfflineListChord(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
