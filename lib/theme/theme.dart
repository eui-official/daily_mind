import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

const background = Color(0xFF272727);

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.sakura,
  useMaterial3: true,
);

double spacing([size = 1]) => size * 8.0;
