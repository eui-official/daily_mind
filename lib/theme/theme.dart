import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primary = Color(0xFFD7FFF1);
const secondary = Color(0xFF77AF9C);

final darkTheme = FlexThemeData.dark(
  fontFamily: GoogleFonts.inter().fontFamily,
  primary: primary,
  secondary: secondary,
  useMaterial3: true,
);

double spacing([size = 1]) => size * 8.0;
