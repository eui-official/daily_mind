import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_applications/base_bottom_sheet.dart';
import 'package:daily_mind/common_widgets/base_dropdown_selector_card.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/extensions/theme.dart';
import 'package:daily_mind/features/sleep_mode_wake_up_audios/presentation/sleep_mode_wake_up_audios_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SleepModeWakeUpAudios extends HookWidget {
  const SleepModeWakeUpAudios({super.key});

  @override
  Widget build(BuildContext context) {
    final onSelectAudio = useCallback(() {
      onShowScrollableBottomSheet(
        context,
        builder: (context, controller) {
          return SleepModeWakeUpAudiosAvailable(
            onSelectAudio: (offlineWakeUpAudio) {},
          );
        },
      );
    }, []);

    return BaseSpacingContainerHorizontal(
      child: BaseDropdownSelectorCard(
        color: context.theme.menuBackground,
        onTap: onSelectAudio,
        trailing: const Text('Bird'),
        child: const Text('Nhạc chuông'),
      ),
    );
  }
}
