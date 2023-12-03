import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> onShowSnackbar(
  BuildContext context, {
  Duration duration = longDuration,
  required String content,
  SnackBarAction? action,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: duration,
      action: action,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(
        vertical: kToolbarHeight * 2,
        horizontal: spacing(2),
      ),
    ),
  );
}
