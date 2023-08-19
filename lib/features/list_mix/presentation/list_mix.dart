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
      padding: EdgeInsets.symmetric(
        horizontal: spacing(2),
        vertical: spacing(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Danh sách kết hợp âm thanh',
            style: context.textTheme.titleLarge,
          ),
          ElevatedButton(
            onPressed: onOpenCreateNewMix,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
            ),
            child: const Text('Thêm mới'),
          )
        ],
      ),
    );
  }
}
