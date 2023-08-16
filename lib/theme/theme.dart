import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const background = Color(0xFF272727);
const primary = Color(0xFFC3E8BD);

final darkTheme = FlexThemeData.dark(
  primary: primary,
);

double spacing([size = 1]) => size * 8.0;
