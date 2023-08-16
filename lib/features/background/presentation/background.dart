import 'package:blur/blur.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/forrest.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    ).blurred(
      blurColor: background,
      blur: 10,
    );
  }
}
