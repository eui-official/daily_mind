import 'package:flutter/material.dart';

class OnlineItemDropdownIcon extends StatelessWidget {
  const OnlineItemDropdownIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Icon(Icons.more_vert),
    );
  }
}
