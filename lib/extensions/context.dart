import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  Color get primaryColorDark50 => theme.primaryColorDark.withOpacity(0.5);
}
