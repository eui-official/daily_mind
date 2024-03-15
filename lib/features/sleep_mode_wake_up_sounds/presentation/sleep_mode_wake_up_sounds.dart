import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/common_widgets/base_dropdown_selector_card.dart';
import 'package:daily_mind/common_widgets/base_spacing/presentation/base_spacing_container_horizontal.dart';
import 'package:daily_mind/extensions/theme.dart';
import 'package:flutter/material.dart';

class SleepModeWakeUpSounds extends StatelessWidget {
  const SleepModeWakeUpSounds({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainerHorizontal(
      child: BaseDropdownSelectorCard(
        color: context.theme.menuBackground,
        onTap: () {},
        trailing: const Text('Bird'),
        child: const Text('Nhạc chuông'),
      ),
    );
  }
}
