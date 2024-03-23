import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_snackbar/base_snackbar.dart';
import 'package:daily_mind/common_hooks/use_effect_delayed.dart';
import 'package:daily_mind/common_hooks/use_mix.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_player_actions/presentation/base_player_users_actions.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/common_widgets/base_stack_with_actions.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/features/mix_collection_button_switcher/presentation/mix_collection_button_switcher.dart';
import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/features/mix_player/presentation/mix_player_background_filter.dart';
import 'package:daily_mind/features/mix_player_list_item_group_category/presentation/mix_player_list_item_group_category.dart';
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
    final mixNotifier = ref.read(mixProvider.notifier);
    final mixState = ref.watch(mixProvider);
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);
    final nameFocusNode = useMemoized(() => FocusNode());

    final onSaveMix = useCallback(
      () async {
        if (mixState.title.isEmpty) {
          await showOkAlertDialog(
            context: context,
            message: 'Vui lòng nhập tiêu đề'.tr(),
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

    useEffectDelayed(() {
      if (baseBackgroundHandler.isMixItemsEmpty) {
        context.pop();
      }
    }, [baseBackgroundHandler.isMixItemsEmpty]);

    return BaseStackWithActions(
      scrollController: scrollController,
      background: MixPlayerBackgroundFilter(mixItems: mixData.mixItems),
      children: [
        Expanded(
          child: BaseSpacingContainerHorizontal(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: space(
                  [
                    BaseContentHeader(
                      title: 'title'.tr(),
                      child: BaseTextField(
                        focusNode: nameFocusNode,
                        hintText: 'titleOfTheMix'.tr(),
                        initialValue: mixState.title,
                        onChanged: mixNotifier.onUpdateTitle,
                      ),
                    ),
                    MixPlayerListItemGroupCategory(
                      mixItems: mixData.mixItems,
                    ),
                  ],
                  height: spacing(5),
                ),
              ),
            ),
          ),
        ),
        BasePlayerUserActions(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          actions: [
            MixCollectionButtonSwitcher(
              isCanAddNewMix: mixNotifier.isCanAddANewMix,
              onDeleteMix: mixNotifier.onDeleteMix,
              onSaveMix: onSaveMix,
            ),
          ],
        ),
      ],
    );
  }
}
