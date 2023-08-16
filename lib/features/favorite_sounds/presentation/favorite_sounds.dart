import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class FavoriteSounds extends StatelessWidget {
  const FavoriteSounds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing(2)),
      child: Column(
        children: [
          Text(
            'Chọn chủ đề',
            style: context.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
