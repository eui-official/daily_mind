import 'package:daily_mind/common_applications/base_audio_handler/application/base_audio_handler.dart';
import 'package:daily_mind/common_providers/base_audio_handler_provider.dart';
import 'package:daily_mind/common_widgets/base_content_header.dart';
import 'package:daily_mind/common_widgets/base_text_field.dart';
import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/features/offline_player/presentation/offline_player_list_item.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OfflinePlayerBottom extends HookConsumerWidget {
  final int playlistId;
  final List<PlaylistItem> items;
  final String? initialTitle;

  const OfflinePlayerBottom({
    super.key,
    required this.items,
    required this.playlistId,
    this.initialTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseAudioHandler = ref.watch(baseAudioHandlerProvider);

    final onChanged = useCallback(
      (String name) {
        baseAudioHandler.onUpdateOfflinePlaylistTitle(name, playlistId);
      },
      [playlistId],
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: spacing(2),
        vertical: spacing(4),
      ),
      decoration: const BoxDecoration(
        gradient: baseLinearGradient,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: space(
            [
              const BaseTimerPicker(),
              BaseContentHeader(
                title: 'name'.tr(),
                child: BaseTextField(
                  initialValue: initialTitle,
                  onChanged: onChanged,
                ),
              ),
              BaseContentHeader(
                title: 'soundList'.tr(),
                child: OfflinePlayerListItem(
                  items: items,
                  playlistId: playlistId,
                  padding: EdgeInsets.only(top: spacing(2)),
                ),
              ),
            ],
            height: spacing(3),
          ),
        ),
      ),
    );
  }
}
