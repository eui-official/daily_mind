import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_widgets/base_chip.dart';
import 'package:daily_mind/constants/audio_froms.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/features/offline_list_audio_minimal/presentation/offline_list_audio_minimal.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeAudio extends HookWidget {
  final OnAudioSelected onAudioSelected;
  final VoidCallback onAudioDeleted;
  final String? title;

  const FocusModeAudio({
    super.key,
    required this.onAudioSelected,
    required this.onAudioDeleted,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final onPickAudio = useCallback(
      () {
        onShowBottomSheet(
          context,
          child: FractionallySizedBox(
            heightFactor: 0.7,
            child: OfflineListAudioMinimal(
              onSelected: (audio) {
                onAudioSelected(audio, fromOffline);
              },
            ),
          ),
        );
      },
      [context],
    );

    final onDeleted = useMemoized(() {
      if (title is String) {
        return onAudioDeleted;
      }

      return emptyNull;
    }, [title]);

    return BaseChip(
      avatar: const Icon(Icons.music_note),
      title: title ?? 'Chọn âm thanh',
      onPressed: onPickAudio,
      onDeleted: onDeleted,
    );
  }
}
