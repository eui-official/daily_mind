import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const celadon = Color(0xFFB0F2B4);
const maize = Color(0xFFFFF07C);
const midnightBlack = Color(0xFF131211);
const red = Color(0xFFE83151);
const secondaryTextColor = Color(0xFFF4EBD9);

final fontFamily = GoogleFonts.inter().fontFamily;

ThemeData createDarkTheme(SupportedTheme theme) {
  return FlexThemeData.dark(
    fontFamily: fontFamily,
    scheme: theme.scheme,
    useMaterial3: true,
    appBarElevation: 2,
    scaffoldBackground: midnightBlack,
    error: red,
    typography: Typography.material2021(platform: defaultTargetPlatform),
    subThemesData: FlexSubThemesData(
      alignedDropdown: true,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorRadius: spacing(2),
    ),
  ).copyWith(
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
  );
}

double spacing([size = 1]) => size * 8.0;
