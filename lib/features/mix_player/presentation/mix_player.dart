import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_scaffold.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/features/mix_collection_button_switcher/presentation/mix_collection_button_switcher.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixPlayer extends HookConsumerWidget {
  const MixPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixState = ref.watch(mixProvider);
    final mixNotifier = ref.read(mixProvider.notifier);
    final mixItems = mixState.mixItems;

    final onSaveMix = useCallback(
      () async {
        if (mixState.title.isEmpty) {
          await showOkAlertDialog(
            context: context,
            message: 'Vui lòng nhập tên'.tr(),
          );
        } else {
          mixNotifier.onAddNewMix();
        }
      },
      [mixState],
    );

    return BaseScaffold(
      footerButtons: [
        MixCollectionButtonSwitcher(
          isCanAddNewMix: mixState.isCanAddANewMix,
          onDeleteMix: mixNotifier.onDeleteMix,
          onSaveMix: onSaveMix,
        ),
      ],
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        child: Column(
          children: space(
            [
              BaseContentHeader(
                title: 'Danh sách âm thanh'.tr(),
                spacingSize: 5,
                child: Column(
                  children: space(
                    mixItems.map((item) => MixPlayerItem(item: item)).toList(),
                    height: spacing(6),
                  ),
                ),
              ),
              BaseContentHeader(
                title: 'name'.tr(),
                child: BaseTextField(
                  hintText: 'nameOfTheMix'.tr(),
                  initialValue: mixState.title,
                  onChanged: mixNotifier.onUpdateTitle,
                ),
              ),
            ],
            height: spacing(10),
          ),
        ),
      ),
    );
  }
}
