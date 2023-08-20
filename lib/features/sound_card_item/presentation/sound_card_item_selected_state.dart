import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class SoundCardItemSelectedState extends StatelessWidget {
  const SoundCardItemSelectedState({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacing(3)),
        border: Border.all(
          width: 2,
          color: context.theme.primaryColor,
        ),
      ),
    );
  }
}
