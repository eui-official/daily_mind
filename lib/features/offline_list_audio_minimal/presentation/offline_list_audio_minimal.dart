import 'package:daily_mind/common_domains/audio_offline.dart';
import 'package:daily_mind/common_widgets/base_list_tile.dart';
import 'package:daily_mind/common_widgets/base_list_view_header.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/constants/offline_audios.dart';
import 'package:daily_mind/features/offline_list_audio_minimal/presentation/offline_list_audio_minimal_preview.dart';
import 'package:daily_mind/features/offline_list_audio_minimal/presentation/offline_list_audio_minimal_provider.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart' hide Trans;
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflineListAudioMinimal extends HookConsumerWidget {
  final ValueChanged<AudioOffline> onSelected;

  const OfflineListAudioMinimal({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offlineListAudioMinimalState =
        ref.watch(offlineListAudioMinimalNotifierProvider);
    final offlineListAudioMinimalNotifier =
        ref.watch(offlineListAudioMinimalNotifierProvider.notifier);

    final onPressed = useMemoized(() {
      if (offlineListAudioMinimalNotifier.isSelected) {
        return () {
          final audio = offlineAudios[offlineListAudioMinimalState];
          onSelected(audio);
          context.pop();
        };
      }

      return emptyNull;
    }, [offlineListAudioMinimalNotifier.isSelected]);

    return Scaffold(
      body: Column(
        children: space(
          [
            BaseListViewHeader(
              title: 'Danh sách âm thanh',
              trailing: IconButton(
                onPressed: context.pop,
                icon: const Icon(Icons.close),
              ),
              child: GroupButton(
                isRadio: true,
                enableDeselect: true,
                buttons: offlineAudios,
                options: const GroupButtonOptions(runSpacing: 0),
                buttonBuilder: (isSelected, audio, context) {
                  return BaseListTile(
                    leading: OfflineListAudioMinimalPreview(audio: audio),
                    title: audio.name.tr(),
                    trailing: isSelected
                        ? Icon(
                            Icons.check_circle_rounded,
                            color: context.theme.primaryColor,
                          )
                        : emptyWidget,
                  );
                },
                onSelected: (value, index, isSelected) {
                  offlineListAudioMinimalNotifier.onSelected(index);
                },
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Chọn âm thanh hiện tại'),
            ),
          ],
          height: spacing(5),
        ),
      ),
    );
  }
}
