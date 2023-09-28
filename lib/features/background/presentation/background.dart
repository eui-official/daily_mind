import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Background extends StatelessWidget {
  final String image;

  const Background({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black38,
                  BlendMode.darken,
                )),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.theme.primaryColor.withOpacity(0.12),
                context.theme.primaryColor.withOpacity(0.26),
                context.theme.primaryColor.withOpacity(0.38),
                context.theme.primaryColor.withOpacity(0.45),
                context.theme.primaryColor.withOpacity(0.54),
                context.theme.primaryColor.withOpacity(0.87),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
