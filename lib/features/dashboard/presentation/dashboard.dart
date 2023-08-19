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
    return const Scaffold(
      body: Stack(
        children: [
          Background(),
          SafeArea(
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
