import 'package:daily_mind/features/add_new_mix_button/presentation/add_new_mix_button.dart';
import 'package:daily_mind/features/app_bar_scrollview/presentation/app_bar_scrollview.dart';
import 'package:daily_mind/features/list_mix/presentation/list_chord.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListMix extends HookConsumerWidget {
  const ListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AppBarScrollview(
        title: 'mixList'.tr(),
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: spacing(2),
              vertical: spacing(3),
            ),
            child: const ListChord(),
          )
        ],
      ),
      floatingActionButton: const AddNewMixButton(),
    );
  }
}
