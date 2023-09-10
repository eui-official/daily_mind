import 'package:daily_mind/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class SettingsThemeColorBox extends StatelessWidget {
  final FlexScheme scheme;

  const SettingsThemeColorBox({
    super.key,
    required this.scheme,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: FlexThemeData.dark(scheme: scheme),
      child: Builder(
        builder: (context) {
          return Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(spacing()),
              color: context.theme.primaryColor,
            ),
          );
        },
      ),
    );
  }
}
