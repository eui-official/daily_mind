import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const background = Color(0xFF12130f);
final secondaryTextColor = Colors.white.withOpacity(0.8);

final fontFamily = GoogleFonts.inter().fontFamily;

ThemeData createDarkTheme(SupportedTheme theme) {
  return FlexThemeData.dark(
    fontFamily: fontFamily,
    scheme: theme.scheme,
    background: background,
    scaffoldBackground: background,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    useMaterial3ErrorColors: true,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    subThemesData: FlexSubThemesData(
      alignedDropdown: true,
      blendOnLevel: 20,
      inputDecoratorFocusedHasBorder: false,
      inputDecoratorUnfocusedHasBorder: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      inputDecoratorFillColor: background,
      inputDecoratorRadius: spacing(2),
      useM2StyleDividerInM3: true,
      useTextTheme: true,
    ),
  );
}

double spacing([size = 1]) => size * 8.0;
