import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/features/mix/domain/mix_item.dart';
import 'package:daily_mind/features/mix_player_item/presentation/mix_player_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MixPlayerListItem extends HookWidget {
  final List<MixItem> mixItems;

  const MixPlayerListItem({
    super.key,
    required this.mixItems,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      return space(
        mixItems.map((item) {
          return MixPlayerItem(item: item);
        }).toList(),
        height: spacing(5),
      );
    }, [mixItems]);

    return BaseContentHeader(
      title: 'Danh sách âm thanh'.tr(),
      spacingSize: 4,
      child: Column(children: children),
    );
  }
}
