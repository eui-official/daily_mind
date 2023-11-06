import 'package:daily_mind/common_widgets/base_empty_list_box.dart';
import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/features/offline_new_mix_button/presentation/offline_new_mix_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OfflineEmptyListBox extends StatelessWidget {
  const OfflineEmptyListBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      child: BaseEmptyListBox(
        imageUrl: 'assets/images/empty_nature.png',
        title: "mixLisEmpty".tr(),
        action: const OfflineNewMixButton(),
      ),
    );
  }
}
