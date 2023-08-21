import 'package:daily_mind/features/app_bar_filter/presentation/app_bar_filter.dart';
import 'package:daily_mind/features/mix_editor_item/presentation/mix_editor_item.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:daily_mind/features/stack_background/presentation/stack_background.dart';
import 'package:daily_mind/features/typography/presentation/list_header.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixEditor extends HookConsumerWidget {
  const MixEditor({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        flexibleSpace: const AppBarFilter(),
        title: const Text('Chỉnh sửa hợp âm'),
      ),
      body: StackBackground(
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
                    id: newMixSelectedState.selectedIds[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: spacing(2));
                },
                itemCount: newMixSelectedState.selectedIds.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
