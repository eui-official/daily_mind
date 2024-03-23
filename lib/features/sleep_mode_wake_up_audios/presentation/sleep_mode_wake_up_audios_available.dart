import 'package:daily_mind/common_domains/offline_audio.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/constants/offline_wake_up_audios.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_audios/presentation/sleep_mode_wake_up_audios_available_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SleepModeWakeUpAudiosAvailable extends HookConsumerWidget {
  final ValueChanged<OfflineAudio> onSelectAudio;

  const SleepModeWakeUpAudiosAvailable({
    super.key,
    required this.onSelectAudio,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepModeWakeUpAudiosAvailableState =
        ref.watch(sleepModeWakeUpAudiosAvailableNotifierProvider);
    final sleepModeWakeUpAudiosAvailableNotifier =
        ref.read(sleepModeWakeUpAudiosAvailableNotifierProvider.notifier);

    final onPreviewAudio = useCallback(
      (OfflineAudio offlineWakeUpAudio) {
        sleepModeWakeUpAudiosAvailableNotifier.onPlaySound(offlineWakeUpAudio);
      },
      [],
    );

    final onStopAudio = useCallback(
      () {
        sleepModeWakeUpAudiosAvailableNotifier.onStopSound();
      },
      [],
    );

    final children = useMemoized(() {
      return kOfflineWakeUpAudios.map((offlineWakeUpAudio) {
        final isPlaying =
            sleepModeWakeUpAudiosAvailableState.currentWakeUpOfflineAudio ==
                offlineWakeUpAudio;

        return ListTile(
          onTap: () => onSelectAudio(offlineWakeUpAudio),
          title: Text(offlineWakeUpAudio.title.tr()),
          trailing: IconButton(
            onPressed: () {
              if (isPlaying) {
                onStopAudio();
              } else {
                onPreviewAudio(offlineWakeUpAudio);
              }
            },
            icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow),
          ),
        );
      }).toList();
    }, [sleepModeWakeUpAudiosAvailableState]);

    return BaseSpacingContainerHorizontal(
      child: ListView(children: children),
    );
  }
}
