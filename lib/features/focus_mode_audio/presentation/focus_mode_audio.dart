import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/constants/audio_froms.dart';
import 'package:daily_mind/features/offline_list_audio_minimal/presentation/offline_list_audio_minimal.dart';
import 'package:daily_mind/types/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FocusModeAudio extends HookWidget {
  final OnAudioSelected onAudioSelected;

  const FocusModeAudio({
    super.key,
    required this.onAudioSelected,
  });

  @override
  Widget build(BuildContext context) {
    final onPickAudio = useCallback(
      () {
        onShowBottomSheet(
          context,
          isScrollControlled: true,
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

    return ElevatedButton.icon(
      icon: const Icon(Icons.music_note),
      label: const Text('Chọn âm thanh'),
      onPressed: onPickAudio,
    );
  }
}
