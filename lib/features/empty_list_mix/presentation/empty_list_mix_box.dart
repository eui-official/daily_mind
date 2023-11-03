import 'package:daily_mind/common_widgets/base_card/presentation/base_card.dart';
import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:daily_mind/constants/sound_card.dart';
import 'package:daily_mind/features/add_new_mix_button/presentation/add_new_mix_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;

class EmptyListMixBox extends StatelessWidget {
  const EmptyListMixBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      image: const AssetImage('assets/images/empty_nature.png'),
      imageHeight: smallImageHeight,
      content: BaseSpacingContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "mixLisEmpty".tr(),
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const AddNewMixButton(),
          ],
        ),
      ),
    );
  }
}
