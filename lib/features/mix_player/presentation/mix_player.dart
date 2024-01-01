import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/base_snackbar/base_snackbar.dart';
import 'package:daily_mind/common_hooks/use_mix.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/common_widgets/base_sliver_list.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/features/mix_collection_button_switcher/presentation/mix_collection_button_switcher.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/features/mix_player/presentation/mix_player_background_filter.dart';
import 'package:daily_mind/features/mix_player_list_item/presentation/mix_player_list_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixPlayer extends HookConsumerWidget {
  final ScrollController scrollController;

  const MixPlayer({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixData = useMix(ref);
    final mixNotifier = ref.watch(mixProvider.notifier);
    final mixState = ref.watch(mixProvider);
    final nameFocusNode = useMemoized(() => FocusNode());

    final onSaveMix = useCallback(
      () async {
        if (mixState.title.isEmpty) {
          await showOkAlertDialog(
            context: context,
            message: 'Vui lòng nhập tên'.tr(),
          );

          nameFocusNode.requestFocus();
        } else {
          await mixNotifier.onAddNewMix();

          if (context.mounted) {
            onShowSnackbar(
              context,
              message: 'Đã lưu vào bộ sưu tập'.tr(),
            );
          }
        }
      },
      [mixState],
    );

    return Stack(
      children: [
        if (mixData.mixItems.isNotEmpty)
          MixPlayerBackgroundFilter(mixItems: mixData.mixItems),
        BaseSpacingContainer(
          padding: EdgeInsets.symmetric(
            horizontal: spacing(2),
            vertical: kToolbarHeight,
          ),
          child: Column(
            children: [
              Expanded(
                child: BaseSliverList(
                  scrollController: scrollController,
                  children: [
                    Column(
                      children: space(
                        [
                          BaseContentHeader(
                            title: 'name'.tr(),
                            child: BaseTextField(
                              focusNode: nameFocusNode,
                              hintText: 'nameOfTheMix'.tr(),
                              initialValue: mixState.title,
                              onChanged: mixNotifier.onUpdateTitle,
                            ),
                          ),
                          MixPlayerListItem(mixItems: mixData.mixItems),
                        ],
                        height: spacing(4),
                      ),
                    ),
                  ],
                ),
              ),
              BasePlayerUserActions(
                actions: [
                  MixCollectionButtonSwitcher(
                    isCanAddNewMix: mixNotifier.isCanAddANewMix,
                    onDeleteMix: mixNotifier.onDeleteMix,
                    onSaveMix: onSaveMix,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
