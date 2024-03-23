import 'package:flutter/material.dart';

extension ThemeExt on ThemeData {
  Color get menuBackground => canvasColor.withOpacity(0.2);
}
