import 'package:daily_mind/common_widgets/base_mix_editor_item.dart';
import 'package:daily_mind/db/schemas/playlist.dart';
import 'package:daily_mind/extensions/string.dart';
import 'package:daily_mind/features/play_mix/presentation/play_mix_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayMixItemEditor extends HookConsumerWidget {
  final int playlistId;
  final PlaylistItem item;

  const PlayMixItemEditor({
    super.key,
    required this.playlistId,
    required this.item,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playMixNotifier = ref.read(playMixProvider.notifier);
    final soundItem = item.id.soundItem;

    final onVolumeChanged = useCallback(
      (double volume) {
        playMixNotifier.updateVolume(volume, item.id, playlistId);
      },
      [playlistId, item],
    );

    return BaseMixEditorItem(
      name: soundItem.name.tr(),
      image: soundItem.image,
      initVolume: item.volume,
      onVolumeChanged: onVolumeChanged,
    );
  }
}
