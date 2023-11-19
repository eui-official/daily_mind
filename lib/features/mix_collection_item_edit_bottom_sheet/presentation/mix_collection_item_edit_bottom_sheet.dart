import 'package:daily_mind/common_widgets/base_backdrop_filter.dart';
import 'package:daily_mind/common_widgets/base_list_tile.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class MixCollectionItemEditBottomSheet extends HookWidget {
  final Playlist playlist;
  final VoidCallback onRenamed;
  final VoidCallback onDeleted;

  const MixCollectionItemEditBottomSheet({
    super.key,
    required this.playlist,
    required this.onRenamed,
    required this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final children = useMemoized(() {
      return [
        BaseListTile(
          leading: const Icon(Icons.edit),
          title: 'Đổi tên',
          onTap: onRenamed,
        ),
        BaseListTile(
          leading: Icon(
            Icons.delete,
            color: context.theme.colorScheme.error,
          ),
          title: 'Xóa',
          color: context.theme.colorScheme.error,
          onTap: onDeleted,
        ),
      ];
    }, [context]);

    return Wrap(
      children: [
        BaseBackdropFilter(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: spacing(2)),
                child: Text(
                  playlist.title ?? emptyString,
                  style: context.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: children.length,
                itemBuilder: (context, index) {
                  return children[index];
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
