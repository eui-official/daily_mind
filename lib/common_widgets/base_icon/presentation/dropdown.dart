import 'package:flutter/material.dart';

class DropdownIcon extends StatelessWidget {
  const DropdownIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Icon(Icons.more_vert),
    );
  }
}
