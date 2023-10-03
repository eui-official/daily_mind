import 'package:daily_mind/common_providers/app_provider.dart';
import 'package:daily_mind/db/db.dart';
import 'package:daily_mind/features/app_bar_filter/presentation/app_bar_filter.dart';
import 'package:daily_mind/features/offline_mix_editor/presentation/offline_mix_editor_add_button.dart';
import 'package:daily_mind/features/offline_mix_editor/presentation/offline_mix_editor_provider.dart';
import 'package:daily_mind/features/offline_mix_editor_item/presentation/mix_editor_item.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_provider.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class OfflineMixEditor extends HookConsumerWidget {
  const OfflineMixEditor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appProvider);
    final newMixSelectedState = ref.watch(newMixProvider);

    final mixEditorMemoized = useMemoized(
      () => mixEditorProvider(newMixSelectedState.selectedStates),
    );

    final mixEditorNotifier = ref.read(mixEditorMemoized.notifier);
    final mixEditorState = ref.watch(mixEditorMemoized);

    final onAddANewOfflineMix = useCallback(
      () {
        db.onAddANewOfflineMix(mixEditorState.offlineMixEditorItemStates);

        context
          ..pop()
          ..pop();
      },
      [mixEditorState.offlineMixEditorItemStates],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        flexibleSpace: const AppBarFilter(),
        title: Text('soundEditor'.tr()),
      ),
      body: Tutorial(
        task: 'mixEditorTutorial',
        targets: [
          TargetFocus(
            keyTarget: mixEditorVolumeKey,
            shape: ShapeLightFocus.RRect,
            radius: spacing(2),
            contents: [
              TargetContent(
                align: ContentAlign.top,
                child: Text('mixEditorContent'.tr()),
              )
            ],
          ),
        ],
        child: Stack(
          alignment: Alignment.center,
          children: [
            StackBackground(
              image: AssetImage(appState.backgroundImage),
              child: SafeArea(
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    left: spacing(2),
                    right: spacing(2),
                    top: kBottomNavigationBarHeight,
                    bottom: kBottomNavigationBarHeight * 2,
                  ),
                  itemBuilder: (context, index) {
                    return MixEditorItem(
                      volumeKey:
                          index == 0 ? mixEditorVolumeKey : ValueKey(index),
                      onItemVolumeChanged:
                          mixEditorNotifier.onItemVolumeChanged,
                      offlineMixEditorItemState:
                          mixEditorState.offlineMixEditorItemStates[index],
                    );
                  },
                  itemCount: mixEditorState.offlineMixEditorItemStates.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 2,
                    mainAxisSpacing: spacing(2),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: spacing(3),
              child: OfflineNewMixEditorAddButton(
                onPressed: onAddANewOfflineMix,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
