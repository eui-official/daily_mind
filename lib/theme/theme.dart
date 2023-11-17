import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const background = Color(0xFF07020D);
const celadon = Color(0xFFB0F2B4);
const maize = Color(0xFFFFF07C);
const red = Color(0xFFE83151);
const secondaryTextColor = Colors.white70;

final fontFamily = GoogleFonts.inter().fontFamily;

ThemeData createDarkTheme(SupportedTheme theme) {
  return FlexThemeData.dark(
    fontFamily: fontFamily,
    scheme: theme.scheme,
    background: background,
    scaffoldBackground: background,
    useMaterial3: true,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    error: red,
    subThemesData: FlexSubThemesData(
      alignedDropdown: true,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorRadius: spacing(2),
    ),
  );
}

double spacing([size = 1]) => size * 8.0;
