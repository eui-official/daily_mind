import 'package:another_flushbar/flushbar.dart';
import 'package:daily_mind/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

void onShowSnackbar(
  BuildContext context, {
  Duration duration = actionDuration,
  VoidCallback? onTap,
  Widget? trailing,
  String? title,
  required String message,
}) {
  Flushbar(
    duration: duration,
    animationDuration: defaultDuration,
    backgroundColor: context.theme.primaryColorDark,
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    forwardAnimationCurve: Curves.easeIn,
    message: message,
    reverseAnimationCurve: Curves.easeOut,
    title: title,
  ).show(context);
}
