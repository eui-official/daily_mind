import 'package:daily_mind/common_widgets/base_spacing_container.dart';
import 'package:flutter/material.dart';

class AudioCardContent extends StatelessWidget {
  final String name;

  const AudioCardContent({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSpacingContainer(
      alignment: Alignment.bottomLeft,
      child: Text(name),
    );
  }
}
