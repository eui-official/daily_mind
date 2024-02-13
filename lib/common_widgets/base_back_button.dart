import 'dart:io';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class BaseBackButton extends StatelessWidget {
  const BaseBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final iconData = Platform.isIOS
        ? Icons.arrow_back_ios_new_rounded
        : Icons.arrow_back_rounded;

    return IconButton(
      onPressed: context.pop,
      icon: Icon(iconData),
    );
  }
}
