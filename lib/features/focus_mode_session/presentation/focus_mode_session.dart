import 'package:daily_mind/constants/constants.dart';
import 'package:daily_mind/db/schemas/pomodoro.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class FocusModeSession extends StatelessWidget {
  final Pomodoro pomodoro;

  const FocusModeSession({
    super.key,
    required this.pomodoro,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight * 2),
        child: Column(
          children: [
            Text(
              pomodoro.title ?? emptyString,
              style: context.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
