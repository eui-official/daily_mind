import 'package:daily_mind/common_widgets/base_header_with_description.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InternetConnectionNotice extends StatelessWidget {
  const InternetConnectionNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: spacing(2),
          vertical: spacing(3),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: BaseHeaderWithDescription(
                name: 'noInternetConnection'.tr(),
                description: 'noInternetNotice'.tr(),
                headerAction: IconButton(
                  onPressed: context.pop,
                  icon: const Icon(Icons.close),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
