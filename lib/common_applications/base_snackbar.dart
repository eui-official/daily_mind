import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> onShowSnackbar(
  BuildContext context, {
  required String content,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      duration: mediumDuration,
    ),
  );
}
