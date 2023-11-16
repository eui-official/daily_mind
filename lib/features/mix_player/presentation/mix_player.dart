import 'package:daily_mind/features/mix/presentation/mix_provider.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixPlayer extends HookConsumerWidget {
  const MixPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mixState = ref.watch(mixProvider);
    final mixItems = mixState.mixItems;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(spacing(2)),
        child: Column(
          children: space(
            mixItems.map((item) {
              return MixPlayerItem(item: item);
            }).toList(),
            height: spacing(6),
          ),
        ),
      ),
    );
  }
}
