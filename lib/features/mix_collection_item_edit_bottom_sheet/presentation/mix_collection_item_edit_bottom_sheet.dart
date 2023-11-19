import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:daily_mind/common_applications/adaptive_dialog_validators.dart';
import 'package:daily_mind/common_applications/base_audio_handler/base_audio_handler.dart';
import 'package:daily_mind/common_applications/safe_builder.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MixCollectionItemEditBottomSheet extends HookConsumerWidget {
  final Playlist playlist;

  const MixCollectionItemEditBottomSheet({
    super.key,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseBackgroundHandler = ref.watch(baseBackgroundHandlerProvider);

    final onRenamed = useCallback(() async {
      final results = await showTextInputDialog(
        context: context,
        textFields: [
          DialogTextField(
            initialText: playlist.title ?? emptyString,
            validator: adaptiveDialogValidators.required,
          ),
        ],
      );

      if (results?.isNotEmpty ?? false) {
        final result = results?.first;

        onSafeValueBuilder(result, (title) {
          baseBackgroundHandler.onUpdateMixPlaylistTitle(
            title,
            playlist.id,
          );
        });
      }
    }, []);

    final children = useMemoized(() {
      return [
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Đổi tên'),
          onTap: onRenamed,
        ),
      ];
    }, [context]);

    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: spacing(2)),
        child: Wrap(
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: children.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return children[index];
              },
            ),
          ],
        ),
      ),
    );
  }
}
