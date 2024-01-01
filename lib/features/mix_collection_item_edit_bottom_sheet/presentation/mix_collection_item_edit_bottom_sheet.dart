import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_bottom_sheet.dart';
import 'package:daily_mind/common_widgets/base_tile/presentation/base_tile.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/mix_collection.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart' hide Trans;

class MixCollectionItemEditBottomSheet extends HookWidget {
  final MixCollection mixCollection;
  final VoidCallback onRenamed;
  final VoidCallback onDeleted;

  const MixCollectionItemEditBottomSheet({
    super.key,
    required this.mixCollection,
    required this.onRenamed,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      return [
        BaseTile(
          leading: const Icon(Icons.edit),
          title: 'Đổi tên'.tr(),
          onTap: onRenamed,
        ),
        BaseTile(
          leading: Icon(
            Icons.delete,
            color: context.theme.colorScheme.error,
          ),
          title: 'Xóa'.tr(),
          color: context.theme.colorScheme.error,
          onTap: onDeleted,
        ),
      ];
    }, [context]);

    return BaseSpacingBottomSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: space(
          [
            Text(
              mixCollection.title ?? kEmptyString,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: space(children, height: spacing(2)),
            ),
          ],
          height: spacing(5),
        ),
      ),
    );
  }
}
