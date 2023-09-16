import 'package:daily_mind/features/settings/domain/supported_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFFD7FFF1);
const secondary = Color(0xFF77AF9C);
const background = Color(0xFF2E1F27);

ThemeData createDarkTheme(SupportedTheme theme) {
  return FlexThemeData.dark(
    fontFamily: GoogleFonts.inter().fontFamily,
    scheme: theme.scheme,
    useMaterial3: true,
    useMaterial3ErrorColors: true,
  );
}

double spacing([size = 1]) => size * 8.0;
