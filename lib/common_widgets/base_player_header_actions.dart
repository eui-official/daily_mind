import 'dart:io';

import 'package:daily_mind/common_widgets/base_back_button.dart';
import 'package:daily_mind/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_airplay/flutter_to_airplay.dart';

class BasePlayerHeaderActions extends StatelessWidget {
  final EdgeInsets? padding;

  const BasePlayerHeaderActions({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RotatedBox(
            quarterTurns: 3,
            child: BaseBackButton(),
          ),
          if (Platform.isIOS)
            AirPlayRoutePickerView(
              tintColor: Colors.white,
              activeTintColor: context.theme.primaryColor,
            ),
        ],
      ),
    );
  }
}
