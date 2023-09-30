import 'package:daily_mind/features/add_new_mix_button/presentation/add_new_mix_button.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/offline_list_chord/presentation/offline_list_chord.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          AppBarScrollview(
            title: 'naturalSounds'.tr(),
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: spacing(2),
                  vertical: spacing(2),
                ),
                child: Column(
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
          ),
        ],
      ),
    );
  }
}
