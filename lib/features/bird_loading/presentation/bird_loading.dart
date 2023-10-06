import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:lottie/lottie.dart';

class BirdLoading extends StatelessWidget {
  const BirdLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.background,
      alignment: Alignment.center,
      child: Lottie.asset(
        'assets/lottie/bird.json',
        fit: BoxFit.cover,
      ),
    );
  }
}
