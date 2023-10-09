import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/utils.dart';

class BaseCircularIndicator extends StatelessWidget {
  final double size;

  const BaseCircularIndicator({
    super.key,
    this.size = 5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: spacing(size),
      height: spacing(size),
      child: SpinKitPulse(color: context.theme.primaryColor),
    );
  }
}
