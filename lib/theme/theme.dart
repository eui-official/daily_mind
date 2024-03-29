import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const background = Color(0xFF0A0A0A);
const celadon = Color(0xFFB0F2B4);
const divider = Color(0xFF1B263B);
const maize = Color(0xFFFFF07C);
const red = Color(0xFFE83151);
const secondaryTextColor = Color(0xFFF4EBD9);

final fontFamily = GoogleFonts.inter().fontFamily;

ThemeData createDarkTheme(SupportedTheme theme) {
  return FlexThemeData.dark(
    fontFamily: fontFamily,
    scheme: theme.scheme,
    useMaterial3: true,
    darkIsTrueBlack: true,
    error: red,
    background: background,
    scaffoldBackground: background,
    subThemesData: FlexSubThemesData(
      alignedDropdown: true,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorRadius: spacing(2),
    ),
  ).copyWith(
    dividerTheme: const DividerThemeData(color: divider),
    cupertinoOverrideTheme: const CupertinoThemeData(
      textTheme: CupertinoTextThemeData(),
    ),
  );
}

double spacing([size = 1]) => size * 8.0;
