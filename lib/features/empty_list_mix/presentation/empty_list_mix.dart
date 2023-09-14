import 'package:daily_mind/features/tutorial/constant/constant.dart';
import 'package:daily_mind/features/tutorial/presentation/tutorial.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart' hide Trans;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class EmptyListMix extends StatelessWidget {
  const EmptyListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tutorial(
      task: 'addANewMixTutorial',
      targets: [
        TargetFocus(
          keyTarget: addNewMixKey,
          contents: [
            TargetContent(
              align: ContentAlign.top,
              child: Text('addNewMixTutorialContent'.tr()),
            ),
          ],
        ),
      ],
      child: Container(
        padding: EdgeInsets.all(spacing(2)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(spacing(2)),
          color: context.theme.colorScheme.background.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: space(
            [
              Text(
                "mixLisEmpty".tr(),
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/playlist.png',
                width: 128,
                height: 128,
                color: context.theme.primaryColor,
              ),
            ],
            height: spacing(2),
          ),
        ),
      ),
    );
  }
}
