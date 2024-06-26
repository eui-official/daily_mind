import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: context.theme.colorScheme.surface,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: space(
            [
              Image.asset(
                'assets/icons/icon.png',
                fit: BoxFit.cover,
                width: spacing(20),
                height: spacing(20),
                color: context.theme.primaryColor,
              ),
              Text(
                'Hít một hơi thật sâu'.tr(),
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.theme.primaryColorDark,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
            height: spacing(2),
          ),
        ),
      ),
    );
  }
}
