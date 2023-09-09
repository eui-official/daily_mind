import 'package:daily_mind/common_applications/images.dart';
import 'package:daily_mind/features/app_logo/presentation/app_logo.dart';
import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:daily_mind/features/list_mix/presentation/list_chord.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ListMix extends StatelessWidget {
  const ListMix({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(image: images.randomBackground),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLogo(),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing(2),
                    vertical: spacing(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Danh sách kết hợp âm thanh',
                              style: context.textTheme.titleLarge,
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(top: spacing(5)),
                                child: const ListChord(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
