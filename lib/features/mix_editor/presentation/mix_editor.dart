import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_bar_filter/presentation/app_bar_filter.dart';
import 'package:daily_mind/features/mix_editor/presentation/mix_editor_add_button.dart';
import 'package:daily_mind/features/mix_editor/presentation/mix_editor_provider.dart';
import 'package:daily_mind/features/mix_editor_item/presentation/mix_editor_item.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixEditor extends HookConsumerWidget {
  const MixEditor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    final mixEditorMemoized = useMemoized(
      () => mixEditorProvider(newMixSelectedState.selectedIds),
    );

    final mixEditorNotifier = ref.read(mixEditorMemoized.notifier);
    final mixEditorState = ref.watch(mixEditorMemoized);

    final onAddANewMix = useCallback(
      () {
        db.addANewMix(mixEditorState.itemStates);

        context
          ..pop()
          ..pop();
      },
      [mixEditorState.itemStates],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        flexibleSpace: const AppBarFilter(),
        title: const Text('Chỉnh sửa âm thanh'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          StackBackground(
            image: appState.backgroundImage,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListHeader(
                  child: Text(
                    'Danh sách âm thanh',
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: spacing(4)),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MixEditorItem(
                        onItemVolumeChanged:
                            mixEditorNotifier.onItemVolumeChanged,
                        itemState: mixEditorState.itemStates[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: spacing(2));
                    },
                    itemCount: mixEditorState.itemStates.length,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: spacing(3),
            child: NewMixEditorAddButton(onPressed: onAddANewMix),
          ),
        ],
      ),
    );
  }
}
