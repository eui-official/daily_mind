import 'package:daily_mind/theme/common.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class SleepModeAddButton extends StatelessWidget {
  const SleepModeAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: spacing(30),
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: space(
            [
              const Text('Thêm báo thức'),
              const Icon(Icons.arrow_forward_rounded),
            ],
            width: spacing(),
          ),
        ),
      ),
    );
  }
}
