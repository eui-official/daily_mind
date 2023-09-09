import 'package:daily_mind/common_applications/images.dart';
import 'package:daily_mind/features/app_logo/presentation/app_logo.dart';
import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:daily_mind/features/list_mix/presentation/list_mix.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(image: images.randomBackground),
          const SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppLogo(),
                Expanded(child: ListMix()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
