import 'package:daily_mind/theme/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class AudioCardSelectedState extends StatelessWidget {
  const AudioCardSelectedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: circularRadius(2),
          border: Border.all(
            width: 2,
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
