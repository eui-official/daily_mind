import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class OpenContainerTransition extends StatelessWidget {
  final Widget openChild;
  final Widget closeChild;

  const OpenContainerTransition({
    super.key,
    required this.openChild,
    required this.closeChild,
  });

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      openBuilder: (context, action) {
        return openChild;
      },
      closedBuilder: (context, action) {
        return closeChild;
      },
    );
  }
}
