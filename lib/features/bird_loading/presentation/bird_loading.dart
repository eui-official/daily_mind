import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class BirdLoading extends StatelessWidget {
  const BirdLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: context.theme.colorScheme.background,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: space(
            [
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  context.theme.primaryColor,
                  BlendMode.modulate,
                ),
                child: Image.asset(
                  'assets/icons/icon.png',
                  fit: BoxFit.cover,
                  width: spacing(20),
                  height: spacing(20),
                ),
              ),
              Text(
                'Hít một hơi thật sâu',
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
