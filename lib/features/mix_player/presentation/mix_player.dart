import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_icon_button_with_title.dart';
import 'package:daily_mind/common_widgets/base_scaffold_sheet.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixPlayer extends HookConsumerWidget {
  const MixPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixState = ref.watch(mixProvider);
    final mixNotifier = ref.watch(mixProvider.notifier);
    final mixItems = mixState.mixItems;

    final onSaveMix = useCallback(
      () async {
        if (mixState.title.isEmpty) {
          await showOkAlertDialog(
            context: context,
            message: 'Vui lòng nhập tên',
          );
        } else {
          db.onAddNewMix(mixState);
        }
      },
      [mixState],
    );

    return BaseScaffoldSheet(
      footerButtons: [
        BaseIconButtonWithTitle(
          onPressed: onSaveMix,
          icon: const Icon(Icons.favorite_outline),
          style: IconButton.styleFrom(
            backgroundColor: context.theme.primaryColorDark,
          ),
          title: 'Lưu vào thư viện',
        ),
      ],
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        child: ListView(
          children: space(
            [
              BaseContentHeader(
                title: 'Danh sách âm thanh',
                spacingSize: 5,
                child: Column(
                  children: space(
                    mixItems.map((item) {
                      return MixPlayerItem(item: item);
                    }).toList(),
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
