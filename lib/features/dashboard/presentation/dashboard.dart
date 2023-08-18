import 'package:daily_mind/features/app_logo/presentation/app_logo.dart';
import 'package:daily_mind/features/background/presentation/background.dart';
import 'package:daily_mind/features/favorite_sounds/presentation/favorite_sounds.dart';
import 'package:daily_mind/theme/theme.dart';
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
          const Background(),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppLogo(),
                Flexible(
                  child: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.only(top: spacing(5)),
                      child: const FavoriteSounds(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
