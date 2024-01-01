import 'package:daily_mind/common_widgets/base_mini_player/presentation/base_mini_player_switcher.dart';
import 'package:flutter/material.dart';

class BaseMiniPlayerPosition extends StatelessWidget {
  const BaseMiniPlayerPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: kBottomNavigationBarHeight * 1.25,
      left: 0,
      right: 0,
      child: SafeArea(
        top: false,
        child: BaseMiniPlayerSwitcher(),
      ),
    );
  }
}
