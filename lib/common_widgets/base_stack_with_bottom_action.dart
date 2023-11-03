import 'package:flutter/material.dart';

class BaseStackWithBottomAction extends StatelessWidget {
  final Widget child;
  final Widget bottom;

  const BaseStackWithBottomAction({
    super.key,
    required this.child,
    required this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            child: child,
          ),
          Positioned(
            bottom: kBottomNavigationBarHeight / 2,
            child: bottom,
          )
        ],
      ),
    );
  }
}
