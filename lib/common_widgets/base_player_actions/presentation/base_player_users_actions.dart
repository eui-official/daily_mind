import 'package:daily_mind/common_widgets/base_time_picker/presentation/base_time_picker.dart';
import 'package:flutter/material.dart';

class BasePlayerUserActions extends StatelessWidget {
  const BasePlayerUserActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        children: [
          BaseTimerPicker(),
        ],
      ),
    );
  }
}
