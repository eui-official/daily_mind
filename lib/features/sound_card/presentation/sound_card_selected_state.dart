import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SoundCardSelectedState extends StatelessWidget {
  const SoundCardSelectedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(spacing(2)),
          border: Border.all(
            width: 2,
            color: context.theme.primaryColor,
          ),
        ),
      ),
    );
  }
}
