import 'package:daily_mind/features/list_mix/presentation/list_chord.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/utils.dart';
import 'package:go_router/go_router.dart';

class ListMix extends HookWidget {
  const ListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onOpenCreateNewMix = useCallback(
      () {
        context.push('/new-mix');
      },
      [],
    );

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: spacing(2),
        vertical: spacing(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Danh sách kết hợp âm thanh',
                  style: context.textTheme.titleLarge,
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: spacing(5)),
                    child: const ListChord(),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: onOpenCreateNewMix,
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 48),
              ),
              child: const Text('Thêm mới'),
            ),
          )
        ],
      ),
    );
  }
}
