import 'package:daily_mind/features/mix_editor_item/presentation/mix_editor_item.dart';
import 'package:daily_mind/features/new_mix/presentation/new_mix_selected_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixEditor extends HookConsumerWidget {
  const MixEditor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newMixSelectedState = ref.watch(newMixSelectedProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa hợp âm'),
      ),
      body: Container(
        child: Column(
          children: newMixSelectedState.selectedIds.map(
            (id) {
              return MixEditorItem(id: id);
            },
          ).toList(),
        ),
      ),
    );
  }
}
